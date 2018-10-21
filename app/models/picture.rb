class Picture < ApplicationRecord
  validates :image, presence: true
  validates :content, length: { in: 1..140 }
  mount_uploader :image, ImageUploader
end
