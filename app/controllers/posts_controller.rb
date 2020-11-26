class PostsController < ApplicationController
  before_action :authenticate_user! #アクセス制限
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :force_redirect_unless_my_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to root_path, notice: "投稿に成功しました"
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to root_path, notice: "投稿を更新しました"
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path, notice: "投稿を削除しました"
    else
      redirect_to root_path, alert: "投稿を削除できませんでした"
    end
  end

  private
   def post_params
     params.require(:post).permit(
        :title, :content, images: []
     )
   end

   def find_post
     @post = Post.find(params[:id])
   end

   def force_redirect_unless_my_post #自分の投稿以外は強制的にトップページにリダイレクトさせる
    return redirect_to root_path, alert:"自分の投稿ではありません" if @post.user != current_user
  end
end
