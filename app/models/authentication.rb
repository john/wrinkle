class Authentication < ApplicationRecord
  include Encryption

  attr_encrypted :token, :key => :encryption_key

  validates :provider, length: { maximum: 50 }
  validates :token, length: { maximum: 512 }

end
