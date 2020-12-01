class Post < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
end
