class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :browsinghistories, dependent: :destroy
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy  #紐付ける名前とクラス名が異なるため、明示的にクラス名とIDを指定して紐付け
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  validates :name, presence:true

  def self.guest #ゲストログイン
    find_or_create_by(name: 'Guest', email: 'guest@example.com') do |user| #ゲストユーザーがデータベースにあれば取り出し、なければ作成する
      user.password = SecureRandom.urlsafe_base64 #ランダムパスワードの作成
    end
  end

  def already_favorited?(post)  #いいねをしたか判定をする
    self.favorites.exists?(post_id: post.id) #self=current.userに結びついているいいねの中でこのpost_idが存在しているか
  end

end
