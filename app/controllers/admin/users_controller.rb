class Admin::UsersController < Admin::AdminApplicationController

  USER_SEARCH = "(lower(users.name) LIKE ?) OR (users.phone_number LIKE ?) OR (users.email LIKE ?)".freeze

  # GET /users
  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 25
    sort = params[:sort] || 'name'
    if params[:q].present?
      @q = params[:q].downcase
      @users = User.where(USER_SEARCH, "%#{@q}%", "%#{@q}%", "%#{@q}%").order("UPPER(#{sort}) DESC").paginate(page: page, per_page: per_page)
    elsif params[:filter].present? && params[:filter].downcase != 'all'
      # @users = User.with_role(params[:filter].to_sym, :any).order("#{sort} DESC").paginate(page: page, per_page: per_page)
    else
      @users = User.order("UPPER(#{sort}) ASC").paginate(page: page, per_page: per_page)
    end
  end


end