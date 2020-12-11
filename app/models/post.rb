class Post < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :browsinghistories, dependent: :destroy
  is_impressionable counter_cache: true

  def self.create_favorite_ranks #Postからデータを取ってくる
    Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end

  def self.create_comment_ranks #Postからデータを取ってくる
    Post.find(Comment.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end

  def self.create_view_ranks #Postからデータを取ってくる
    Post.find(Impression.group(:impressionable_id).order('count(impressionable_id) desc').limit(3).pluck(:impressionable_id))
  end

  def self.search(search) #postを検索
    if search
      where(['title LIKE ?', "%#{search}%"]) #検索とpost.titleの部分一致を表示
    else
      all
   end
  end

end


