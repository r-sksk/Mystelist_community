class MysteryController < ApplicationController
  def index
    @posts = Post.page(params[:page]).per(10).all.order(created_at: :desc)
  end
end
