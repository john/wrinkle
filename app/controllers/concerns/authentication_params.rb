module AuthenticationParams
  extend ActiveSupport::Concern

  private

  def set_authentication
    @authentication = Authentication.find(params[:id])
  end

  def authentication_params
    params.require(:authentication).permit(:provider, :token)
  end

end