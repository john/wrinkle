class Identity < ApplicationRecord
  belongs_to :user

  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  # def self.find_for_oauth(auth)
  #   find_or_create_by(uid: auth.uid, provider: auth.provider)
  # end

  def self.find_for_oauth(auth)
    if identity = find_by(uid: auth.uid, provider: auth.provider)
      identity
    else
      params = {  uid: auth.uid,
                  provider: auth.provider,
                  token: auth.credentials.token,
                  name: auth.info.name,
                  email: auth.info.email,
                  image_url: auth.info.image,
                  expires_at: auth.credentials.expires_at }

      create!( params )
    end
  end
end


# auth: #<OmniAuth::AuthHash
#
# credentials=#<OmniAuth::AuthHash
#   expires=true
#   expires_at=1484523472    token="EAAEMzrPeq5YBAGHkEMHibHTsz9aMZBxzET2YzirdCCAVpZBeZCOtMPZBSpoHhvapuRZBhbrRxdyrcUvP98tZBHsePlxJWJLEy7iNUy80niQGU6ogZCeEYUzJYiI4vUbok6XgK4ESkrCa9gjQDhvQnJteoV1bMFVk983vBVmzY2ndPY0oU5qhM2F">
#
#   extra=#<OmniAuth::AuthHash
#     raw_info=#<OmniAuth::AuthHash
#       email="john@fnnny.com"
#       id="675003241"
#       name="John McGrath">> info=#<OmniAuth::AuthHash::InfoHash email="john@fnnny.com"
#       image="http://graph.facebook.com/v2.6/675003241/picture" name="John McGrath"> provider="facebook" uid="675003241">