require 'rails_helper'

RSpec.describe "documents/edit", type: :view do
  before(:each) do
    @document = assign(:document, Document.create!(
      :author => "MyString",
      :dateline => "MyString",
      :title => "MyString",
      :subtitle => "MyString",
      :body_html => "MyText"
    ))
  end

  it "renders the edit document form" do
    render

    assert_select "form[action=?][method=?]", document_path(@document), "post" do

      assert_select "input#document_author[name=?]", "document[author]"

      assert_select "input#document_dateline[name=?]", "document[dateline]"

      assert_select "input#document_title[name=?]", "document[title]"

      assert_select "input#document_subtitle[name=?]", "document[subtitle]"

      assert_select "textarea#document_body_html[name=?]", "document[body_html]"
    end
  end
end
