class Document < ApplicationRecord
  include Providers

  include PublicActivity::Model
  tracked owner: proc {|controller, model| controller.current_user }, provider: proc {|controller, model| model.source }

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, length: { maximum: 200 }, presence: true

  # TODO: all these 'create_or_update_from_*' methods can be condensed
  #       into a single generalized method.

  # READ
  def self.create_or_update_from_google_drive(id, file)
    if @document = Document.where(source: 'google', source_id: file.id).first
      @document.update!(body_html: file)
    else
      @document = Document.create!( Document.google_drive_doc_hash(file) )
    end
  end

  def self.create_or_update_from_wordpress(post)
    if @document = Document.where(source: 'wordpress', source_id: post['id']).first
      # ...
    else
      doc_hash = Document.wordpress_doc_hash(post)
      @document = Document.create!( doc_hash )
    end
  end

  def self.create_or_update_from_quip(thread)
    if @document = Document.where(source: 'quip', source_id: thread['thread']['id']).first
      source_updated_at = Time.at( (thread['thread']['updated_usec'].to_i / 1000000) ).utc.to_datetime
      unless source_updated_at == @document.source_updated_at
        @document = Document.update( Document.quip_doc_hash(thread) )
      end
    else
      @document = Document.create!( Document.quip_doc_hash(thread) )
    end
  end

  def self.update_from_google_drive(file_id, file)
    @document = Document.where(source: 'google_drive', source_id: file_id).first
    @document.update!(body_html: file)
  end

  def update_from_google_drive(user)
    self.body_html = GoogleDriveService.get_body(user, self.source_id)
  end


  # WRITE

  # TODO: call this 'teleport_to(provider: :wordpress, provider_id: 1234) (or 'beam_to'? just 'send_to'?)
  def push_to_wordpress
    WordpressService.create_post( {} )
  end

  def link
    if self.source == 'google_drive'
      if self.mime_type.include?('spreadsheet')
        "https://docs.google.com/spreadsheets/d/#{source_id}"
      elsif self.mime_type.include?('document')
        "https://docs.google.com/document/d/#{source_id}"
      else
        self.source_link
      end
    else
      self.source_link
    end
  end


  private

  # TODO: consider moving each of these into their respective service classes
  def self.wordpress_doc_hash(post)
    {
      source: 'wordpress',
      source_id: post['id'],
      source_slug: post['slug'],
      source_created_at: post['date'], # need to force this and updated_at to dates, or will db do?
      source_updated_at: post['modified'],
      source_link: post['link'],
      kind: post['type'],
      title: post['title']['rendered'],
      author_id: post['author'],
      body_html: post['content']['rendered'],
    }
  end

  # author: file.owners.display_name
  def self.google_drive_doc_hash(file)
    {
      source: 'google_drive',
      source_id: file.id,
      source_created_at: file.created_time,
      source_updated_at: file.modified_time,
      source_link: file.web_view_link,
      kind: file.kind,
      mime_type: file.mime_type,
      title: file.name
    }
  end

  def self.quip_doc_hash(thread)
    {
      source: 'quip',
      source_id: thread['thread']['id'],
      source_created_at: Time.at( (thread['thread']['created_usec'].to_i / 1000000) ).utc.to_datetime,
      source_updated_at: Time.at( (thread['thread']['updated_usec'].to_i / 1000000) ).utc.to_datetime,
      source_link: thread['thread']['link'],
      title: thread['thread']['title'],
      body_html: thread['html']
    }
  end

end
