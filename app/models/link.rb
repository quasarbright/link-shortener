class Link < ApplicationRecord
  belongs_to :user, foreign_key: :creator_id
  validates :slug, presence: true, uniqueness: true, format: {
    with: /\A[a-zA-Z0-9_-]+\z/,
    message: "Only allows letters, numbers, underscore, and dash",
  }
  validates :destination, presence: true, url: true
  validates_presence_of :creator_id

  def to_param
    slug
  end
end
