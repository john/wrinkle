class Document < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  def self.create_or_update_from_quip_threads(thread)
    if @document = Document.where(source: 'quip', source_id: thread['thread']['id']).first
      source_updated_at = Time.at( (thread['thread']['updated_usec'].to_i / 1000000) ).utc.to_datetime
      unless source_updated_at == @document.source_updated_at
        @document = Document.update( Document.thread_hash(thread) )
      end
    else
      @document = Document.create!( Document.thread_hash(thread) )
    end
  end

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
