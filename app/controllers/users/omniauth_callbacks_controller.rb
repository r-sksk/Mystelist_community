class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2 # callback for google
    callback_for(:google)
  end

  def callback_for(provider)
    @user = User.from_omniauth(request.env["omniauth.auth"]) #googoleアカウントから取得したメールアドレスや、名前のデータを取得
    sign_in_and_redirect @user, event: :authentication
    set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
  end

    def failure
      redirect_to root_path
    end

  end