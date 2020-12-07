class Post < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :browsinghistories, dependent: :destroy

  def self.create_favorite_ranks #Postからデータを取ってくる
    Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end

  def self.create_comment_ranks #Postからデータを取ってくる
    Post.find(Comment.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end

end


