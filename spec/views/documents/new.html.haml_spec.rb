require 'rails_helper'

RSpec.describe "documents/new", type: :view do
  before(:each) do
    assign(:document, Document.new(
      :author => "MyString",
      :dateline => "MyString",
      :title => "MyString",
      :subtitle => "MyString",
      :body_html => "MyText"
    ))
  end

  it "renders new document form" do
    render

    assert_select "form[action=?][method=?]", documents_path, "post" do

      assert_select "input#document_author[name=?]", "document[author]"

      assert_select "input#document_dateline[name=?]", "document[dateline]"

      assert_select "input#document_title[name=?]", "document[title]"

      assert_select "input#document_subtitle[name=?]", "document[subtitle]"

      assert_select "textarea#document_body_html[name=?]", "document[body_html]"
    end
  end
end
