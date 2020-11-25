class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]
  before_action :authenticate_user! #アクセス制限

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "プロフィール情報の登録が完了しました"
    else
      render :new
    end
  end

  def update
    @user = User.update(user_params)
    if @user.save
      redirect_to  root_path, notice: "プロフィール情報の更新が完了しました"
    else
      render :edit
    end
  end

  def destroy
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
