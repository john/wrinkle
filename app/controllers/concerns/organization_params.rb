module OrganizationParams
  extend ActiveSupport::Concern

  private

  def set_organization
    @organization = Organization.find(params[:id])
  end

  def organization_params
    params.require(:organization).permit(:name, :slug, :description)
  end

end