class Admin::AuthenticationsController < Admin::AdminApplicationController
  include AuthenticationParams

  # GET /organizations
  def index
    @authentications = Authentication.all
  end

  # GET /organizations/new
  def new
    @authentication = Authentication.new
  end

  # POST /organizations
  def create
    @authentication = Authentication.new(authentication_params)

    if @authentication.save
      redirect_to @authentication, notice: 'Authentication was successfully created.'
    else
      render :new
    end
  end

end
