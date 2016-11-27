class OrganizationsController < ApplicationController
  include OrganizationParams

  before_action :set_organization, only: [:show, :edit, :update]

  # GET /organizations/1
  def show
  end

  # GET /organizations/1/edit
  def edit
  end

  # PATCH/PUT /organizations/1
  def update
    if @organization.update(organization_params)
      redirect_to @organization, notice: 'Organization was successfully updated.'
    else
      render :edit
    end
  end

end
