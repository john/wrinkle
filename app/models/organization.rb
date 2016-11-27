class Organization < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  has_many :users
  has_many :authentications

  validates :name, length: { maximum: 50 }, presence: true
  validates :slug, length: { maximum: 100 }

  def quip_auth
    self.authentications.where(provider: 'quip').first
  end

  def quip_authed?
    self.authentications.where(provider: 'quip').present?
  end

end
