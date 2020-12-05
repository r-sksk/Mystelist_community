class FavoritesController < ApplicationController
  before_action :find_post

  def create
    @favorite = current_user.favorites.create(post_id: params[:post_id]) #current.userに結びついたいいねを作成
  end

  def destroy
    @favorite = current_user.favorites.find_by(post_id: @post.id) #favoriteを見つける
    @favorite.destroy
  end

  private
   def find_post
     @post = Post.find(params[:post_id])
   end
end
