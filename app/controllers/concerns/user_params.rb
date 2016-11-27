module UserParams
  extend ActiveSupport::Concern

  private

  def set_user
    @user = User.friendly.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :description, :email)
  end

end