class MysteryController < ApplicationController
  def index
    @posts = Post.page(params[:page]).per(10).search(params[:search]).all.order(created_at: :desc)
    @favorite_ranks = Post.create_favorite_ranks
    @comment_ranks = Post.create_comment_ranks
    @view_ranks = Post.create_view_ranks
  end
end
