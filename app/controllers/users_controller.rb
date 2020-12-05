class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! #アクセス制限

  def show
  end

  def favorites #いいね履歴
    @user = User.find(params[:user_id]) #find_userだとエラーになるため記述
    @favorites = Favorite.where(user_id: @user.id)
  end

  def histories #閲覧履歴
    @histories = current_user.browsinghistories.all.order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user = current_user
    if @user.save
      redirect_to root_path, notice: "プロフィール情報の登録が完了しました"
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "プロフィール情報の更新が完了しました"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: 'アカウントを削除しました。'
  end

  private
   def user_params
     params.require(:user).permit(
         :name, :word, :self_introduction, :image
     )
   end

   def find_user
     @user = User.find(params[:id])
   end

end
