class UsersController < ApplicationController
  include UserParams

  skip_before_action :ensure_signup_complete, only: [:finish_signup]
  before_action :set_user, only: [:show, :finish_signup]

  def show
  end

  # GET/PATCH /users/:id/finish_signup
  def finish_signup
    # authorize! :update, @user
    if request.patch? && params[:user] #&& params[:user][:email]
      if @user.update(user_params)
        # @user.skip_reconfirmation!
        sign_in(@user, :bypass => true)
        redirect_to root_path, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

end