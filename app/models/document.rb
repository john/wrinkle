class Document < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, length: { maximum: 200 }, presence: true

  def self.create_or_update_from_quip(thread)
    if @document = Document.where(source: 'quip', source_id: thread['thread']['id']).first
      source_updated_at = Time.at( (thread['thread']['updated_usec'].to_i / 1000000) ).utc.to_datetime
      unless source_updated_at == @document.source_updated_at
        @document = Document.update( Document.thread_hash(thread) )
      end
    else
      @document = Document.create!( Document.thread_hash(thread) )
    end
  end

  # TODO: should this make another call and gets the full contents of the doc?
  #       probably on demand--stubs can be used for list view & typeahead
  def self.create_or_update_from_google_drive(file)
    if @document = Document.where(source: 'google', source_id: file.id).first
    #   # TODO: see if you can update timestamp from Google, update only if necessary
      @document.update_from_google_drive
    else
      # author: file.owners.display_name
      @document = Document.create!( source: 'google_drive', source_id: file.id,
                                    source_created_at: file.created_time, source_updated_at: file.modified_time,
                                    source_link: file.web_view_link, kind: file.kind, mime_type: file.mime_type, title: file.name)
    end
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

  def update_from_google_drive(user)
    self.body_html = GoogleDriveService.get_body(user, self.source_id)
  end


  private



  def self.thread_hash(thread)
    { source: 'quip',
      source_id: thread['thread']['id'],
      source_created_at: Time.at( (thread['thread']['created_usec'].to_i / 1000000) ).utc.to_datetime,
      source_updated_at: Time.at( (thread['thread']['updated_usec'].to_i / 1000000) ).utc.to_datetime,
      source_link: thread['thread']['link'],
      title: thread['thread']['title'],
      body_html: thread['html'] }
  end
end
