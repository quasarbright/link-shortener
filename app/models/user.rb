class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :email
  has_many :links, foreign_key: :creator_id, dependent: :destroy
end
