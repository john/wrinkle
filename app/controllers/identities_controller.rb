class IdentitiesController < ApplicationController

  def destroy
    @identity = Identity.find(params[:id])
    @identity.destroy
    redirect_back(fallback_location: root_path)
  end

end