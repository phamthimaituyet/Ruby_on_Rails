class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
      def configure_permitted_parameters
       devise_parameter_sanitizer.permit :sign_up, keys: [:name, :avatar, :birth, :count_post, :status]
       devise_parameter_sanitizer.permit :account_update, keys: [:name, :avatar, :birth, :count_post, :status]
      end 
    protect_from_forgery with: :null_session
end
