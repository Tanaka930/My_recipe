class Recipe < ApplicationRecord

  belongs_to :user
  has_many :comments
  has_many :contents

  mount_uploader :image, ImageUploader
end