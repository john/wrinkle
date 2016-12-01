class Authentication < ApplicationRecord
  include Encryption

  belongs_to :organization

  attr_encrypted :email, :key => :encryption_key
  attr_encrypted :token, :key => :encryption_key
  attr_encrypted :username, :key => :encryption_key
  attr_encrypted :password, :key => :encryption_key
  attr_encrypted :site_id, :key => :encryption_key

  # validates :provider, length: { maximum: 50 }
  # validates :token, length: { maximum: 512 }
  # validates :username, length: { maximum: 256 }
  # validates :password, length: { maximum: 256 }or
  #
  # validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  # validates :email, length: { maximum: 50 }

end
