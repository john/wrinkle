require 'rails_helper'

RSpec.describe "Organizations", type: :request do
  describe "GET /organizations/show" do
    let(:organization) { create :organization }

    it "redirects if not logged in" do
      get organization_path(organization)
      expect(response).to have_http_status(302)
    end

    # it "lets in logged-in users" do
    #   user = create(:user)
    #   sign_in user
    #
    #   get organization_path(organization)
    #   expect(response).to have_http_status(200)
    # end

  end
end
