class Users::SessionsController < Devise::SessionsController

  def new_guest #ゲストユーザーのログイン
    user = User.guest
    sign_in user
    redirect_to root_path, notice: "ゲストとしてログインしました。"
  end

end