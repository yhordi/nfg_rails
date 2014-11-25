class User < ActiveRecord::Base
  has_secure_password
  validates :username, :presence => true, :uniqueness => true
  validates :username, length: { minimum: 6 }
end