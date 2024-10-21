class Link < ApplicationRecord
  validates :slug, presence: true, uniqueness: true, format: {
    with: /\A[a-zA-Z0-9_-]+\z/,
    message: "Only allows letters, numbers, underscore, and dash",
  }
  validates :destination, presence: true, url: true

  def to_param
    slug
  end
end
