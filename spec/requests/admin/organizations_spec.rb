require 'rails_helper'

RSpec.describe "Organizations", type: :request do
  describe "GET /admin/organizations" do
    it "works! (now write some real specs)" do
      get admin_organizations_path
      expect(response).to have_http_status(302)
    end
  end

  describe "GET /admin/organizations/new" do
    it "works! (now write some real specs)" do
      get new_admin_organization_path
      expect(response).to have_http_status(302)
    end
  end
end
