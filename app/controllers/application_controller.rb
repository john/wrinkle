class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true

  rescue_from(ActionController::RoutingError, ActionController::UnknownController, ActiveRecord::RecordNotFound) do
    redirect_to '/404.html'
  end

  before_action :authenticate_user!
  before_action :ensure_signup_complete
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    root_path
  end

  private

    # def authenticate_user!
    #   if user_signed_in?
    #     super
    #   else
    #     render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    #   end
    # end

    # from http://sourcey.com/rails-4-omniauth-using-devise-with-twitter-facebook-and-linkedin/
    def ensure_signup_complete
      # Ensure we don't go into an infinite loop
      return if !user_signed_in? || action_name == 'finish_signup'

      # Redirect to the 'finish_signup' page if the user
      # email hasn't been verified yet
      if current_user && !current_user.email_verified?
        redirect_to finish_signup_path(current_user)
      end
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :description, :email])
    end

end
