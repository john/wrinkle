require 'rails_helper'

RSpec.describe "Documents", type: :request do
  describe "GET /documents" do
    it "redirects if not logged in" do
      get documents_path
      expect(response).to have_http_status(302)
    end

    describe "when logged in" do

    end

  end
end
