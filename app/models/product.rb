class Product < ApplicationRecord
  attr_accessor :buy_num

  mount_uploader :image, ImageUploader
  validates :title, presence: true
end
