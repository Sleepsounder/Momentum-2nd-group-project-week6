class User < ApplicationRecord

  has_many :twerps

  has_secure_token :api_token
  has_secure_password

  #code from reddit project:
  #  acts_as_voter
  # has_many :posts
  # has_many :comments
  # has_secure_password
  # validates :email, presence: true, uniqueness: true

  # need/want to add validations for unique user email address? if so:
  # validates :email, presence: true, uniqueness: true
end
