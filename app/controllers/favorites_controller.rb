class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:id])
    @favorite = current_user.favorites.create(post_id: params[:post_id]) #current.userに結びついたいいねを作成
  end

  def destroy
    @post = Post.find(params[:id])
    @favorite = current_user.favorites.find_by(post_id: @post.id) #favoriteを見つける
    @favorite.destroy
  end
end
