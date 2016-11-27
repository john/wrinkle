require 'rails_helper'

RSpec.describe Admin::OrganizationsController, type: :controller do

  let(:valid_session) { {} }

  describe "GET index" do
    it "fails if not logged in" do
      get :index
      expect(response).to have_http_status(302)
    end

    context "logged in" do
      login_user

      it "assigns all organizations as @organizations" do
        organization = create :organization #Organization.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(assigns(:organizations)).to eq([organization])
      end
    end
  end
end
