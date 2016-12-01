class Organization < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  has_many :users
  has_many :authentications

  validates :name, length: { maximum: 50 }, presence: true
  validates :slug, length: { maximum: 100 }

  # TODO: these all need to be generalized so that you don't
  # need a new method every time a new provider is added. Maybe there should
  # be a 'providers' table?
  def quip_auth
    self.authentications.where(provider: 'quip').first
  end

  def wordpress_auth
    site_id = self.authentications.where(provider: 'wordpress').first
    logger.debug "----------> site_id: #{site_id}"
    site_id
  end

  def quip_authed?
    self.authentications.where(provider: 'quip').present?
  end

end
