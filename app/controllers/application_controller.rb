class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? #deviseの設定

  private
    def configure_permitted_parameters #deviseの設定
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
