require 'rails_helper'

RSpec.describe DocumentsController, type: :controller do

  let(:valid_attributes) {
    { title: 'foo', body_html: 'bar' }
  }

  let(:invalid_attributes) {
    { title: '', body_html: 'bar' } # no title
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DocumentsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    let(:document) { create :document }

    it "fails if not logged in" do
      get :index
      expect(response).to have_http_status(302)
    end

    context "logged in" do
      login_user

      it "assigns all documents as @documents" do
        get :index, params: {}, session: valid_session
        expect(assigns(:quip_docs)).to eq([document])
      end
    end
  end

  describe "GET #show" do
    let(:document) { create :document }

    it "fails if not logged in" do
      document = create :document
      get :show, params: {id: document.to_param}, session: valid_session
      expect(response).to have_http_status(302)
    end

    context "logged in" do
      login_user

      it "assigns the requested document as @document" do
        get :show, params: {id: document.to_param}, session: valid_session
        expect(assigns(:document)).to eq(document)
      end
    end
  end

  describe "GET #new" do
    it "fails if not logged in" do
      get :new, params: {}, session: valid_session
      expect(response).to have_http_status(302)
    end

    context "logged in" do
      login_user

      it "assigns a new document as @document" do
        get :new, params: {}, session: valid_session
        expect(assigns(:document)).to be_a_new(Document)
      end
    end
  end

  describe "GET #edit" do
    let(:document) { create :document }

    it "fails if not logged in" do
      get :edit, params: {id: document.to_param}, session: valid_session
      expect(response).to have_http_status(302)
    end

    context "logged in" do
      login_user

      it "assigns the requested document as @document" do
        get :edit, params: {id: document.to_param}, session: valid_session
        expect(assigns(:document)).to eq(document)
      end
    end
  end

  describe "POST #create" do
    it "fails if not logged in" do
      post :create, params: {document: valid_attributes}, session: valid_session
      expect(response).to have_http_status(302)
    end

    context "with valid params" do
      login_user

      it "creates a new Document" do
        expect {
          post :create, params: {document: valid_attributes}, session: valid_session
        }.to change(Document, :count).by(1)
      end

      it "assigns a newly created document as @document" do
        post :create, params: {document: valid_attributes}, session: valid_session
        expect(assigns(:document)).to be_a(Document)
        expect(assigns(:document)).to be_persisted
      end

      it "redirects to the created document" do
        post :create, params: {document: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Document.last)
      end
    end

    context "with invalid params" do
      login_user

      it "assigns a newly created but unsaved document as @document" do
        post :create, params: {document: invalid_attributes}, session: valid_session
        expect(assigns(:document)).to be_a_new(Document)
      end

      it "re-renders the 'new' template" do
        post :create, params: {document: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    let(:new_attributes) {
      { title: 'foo two new', body_html: 'bar you' }
    }



{"utf8"=>"✓",
  "authenticity_token"=>"BVhdea/5WdU0m6EUVNBW1cj18Q89WBPhflJevyFXMsy4iprrhWB1hOEvQX+NVcLaDv3hzhz+Hcday7zSJbF+Bw==",
  "document"=>{"source"=>"google_drive", "source_id"=>"1b_S0RRexyZXLUOCIVe6PotsFNs-6_IBKNjxL_XCwWAM",
      "author"=>"a", "dateline"=>"", "title"=>"Grouper Overview", "subtitle"=>"", "body_html"=>""},
  "commit"=>"Save", "id"=>"grouper-overview"}


    it "fails if not logged in" do
      document = create :document
      put :update, params: {id: document.id, document: new_attributes}, session: valid_session
      expect(response).to have_http_status(302)
    end

    context "with valid params" do
      login_user

      it "updates the requested document" do
        document = create :document
        put :update, params: { id: document.id, document: new_attributes }, session: valid_session
        # document.reload
        document2 = Document.find( document.id )

        expect(document2.title).to eq 'foo two new'
      end

      it "assigns the requested document as @document" do
        document = Document.create! valid_attributes
        put :update, params: {id: document.to_param, document: valid_attributes}, session: valid_session
        expect(assigns(:document)).to eq(document)
      end

      # it "redirects to the document" do
      #   document = Document.create! valid_attributes
      #   put :update, params: {id: document.to_param, document: valid_attributes}, session: valid_session
      #   expect(response).to redirect_to(document)
      # end
    end

  #   context "with invalid params" do
  #     it "assigns the document as @document" do
  #       document = Document.create! valid_attributes
  #       put :update, params: {id: document.to_param, document: invalid_attributes}, session: valid_session
  #       expect(assigns(:document)).to eq(document)
  #     end
  #
  #     it "re-renders the 'edit' template" do
  #       document = Document.create! valid_attributes
  #       put :update, params: {id: document.to_param, document: invalid_attributes}, session: valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  end

  # describe "DELETE #destroy" do
  #   it "destroys the requested document" do
  #     document = Document.create! valid_attributes
  #     expect {
  #       delete :destroy, params: {id: document.to_param}, session: valid_session
  #     }.to change(Document, :count).by(-1)
  #   end
  #
  #   it "redirects to the documents list" do
  #     document = Document.create! valid_attributes
  #     delete :destroy, params: {id: document.to_param}, session: valid_session
  #     expect(response).to redirect_to(documents_url)
  #   end
  # end

end
