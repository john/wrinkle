class Identity < ApplicationRecord
  belongs_to :user

  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider
  validates :provider, length: { maximum: 50 }
  validates :uid, length: { maximum: 128 }
  validates :token, length: { maximum: 512 }
  validates :refresh_token, length: { maximum: 512 }
  validates :name, length: { maximum: 128 }
  validates :email, length: { maximum: 128 }
  validates :image_url, length: { maximum: 128 }

  def self.find_for_oauth(auth)
    if identity = find_by(uid: auth.uid, provider: auth.provider)
      identity
      identity.token = auth.credentials.token
      identity.refresh_token = auth.credentials.refresh_token
      identity.save
    else
      params = {  uid: auth.uid,
                  provider: auth.provider,
                  token: auth.credentials.token,
                  refresh_token: auth.credentials.refresh_token.blank? ? '' : auth.credentials.refresh_token,
                  name: auth.info.name,
                  email: auth.info.email,
                  image_url: auth.info.image,
                  expires_at: auth.credentials.expires_at }

      create!( params )
    end
  end
end
