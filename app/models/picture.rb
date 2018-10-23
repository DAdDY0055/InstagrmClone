class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  validates :content, length: { in: 1..140 }
  belongs_to :user
end
