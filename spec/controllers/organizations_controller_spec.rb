require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Organization. As you add validations to Organization, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # OrganizationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #show" do
    it "assigns the requested organization as @organization" do
      organization = Organization.create! valid_attributes
      get :show, params: {id: organization.to_param}, session: valid_session
      expect(assigns(:organization)).to eq(organization)
    end
  end

  describe "GET #new" do
    it "assigns a new organization as @organization" do
      skip "broken"
      get :new, params: {}, session: valid_session
      expect(assigns(:organization)).to be_a_new(Organization)
    end
  end

  describe "GET #edit" do
    it "assigns the requested organization as @organization" do
      organization = Organization.create! valid_attributes
      get :edit, params: {id: organization.to_param}, session: valid_session
      expect(assigns(:organization)).to eq(organization)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Organization" do
        expect {
          post :create, params: {organization: valid_attributes}, session: valid_session
        }.to change(Organization, :count).by(1)
      end

      it "assigns a newly created organization as @organization" do
        post :create, params: {organization: valid_attributes}, session: valid_session
        expect(assigns(:organization)).to be_a(Organization)
        expect(assigns(:organization)).to be_persisted
      end

      it "redirects to the created organization" do
        post :create, params: {organization: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Organization.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved organization as @organization" do
        post :create, params: {organization: invalid_attributes}, session: valid_session
        expect(assigns(:organization)).to be_a_new(Organization)
      end

      it "re-renders the 'new' template" do
        post :create, params: {organization: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested organization" do
        organization = Organization.create! valid_attributes
        put :update, params: {id: organization.to_param, organization: new_attributes}, session: valid_session
        organization.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested organization as @organization" do
        organization = Organization.create! valid_attributes
        put :update, params: {id: organization.to_param, organization: valid_attributes}, session: valid_session
        expect(assigns(:organization)).to eq(organization)
      end

      it "redirects to the organization" do
        organization = Organization.create! valid_attributes
        put :update, params: {id: organization.to_param, organization: valid_attributes}, session: valid_session
        expect(response).to redirect_to(organization)
      end
    end

    context "with invalid params" do
      it "assigns the organization as @organization" do
        organization = Organization.create! valid_attributes
        put :update, params: {id: organization.to_param, organization: invalid_attributes}, session: valid_session
        expect(assigns(:organization)).to eq(organization)
      end

      it "re-renders the 'edit' template" do
        organization = Organization.create! valid_attributes
        put :update, params: {id: organization.to_param, organization: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested organization" do
      organization = Organization.create! valid_attributes
      expect {
        delete :destroy, params: {id: organization.to_param}, session: valid_session
      }.to change(Organization, :count).by(-1)
    end

    it "redirects to the organizations list" do
      organization = Organization.create! valid_attributes
      delete :destroy, params: {id: organization.to_param}, session: valid_session
      expect(response).to redirect_to(organizations_url)
    end
  end

end
