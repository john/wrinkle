require 'rails_helper'

RSpec.describe "documents/index", type: :view do
  before(:each) do
    assign(:quip_docs, [
      Document.create!(
        :author => "Author",
        :dateline => "Dateline",
        :title => "Title",
        :subtitle => "Subtitle",
        :body_html => "MyText"
      ),
      Document.create!(
        :author => "Author",
        :dateline => "Dateline",
        :title => "Title",
        :subtitle => "Subtitle",
        :body_html=> "MyText"
      )
    ])
  end

  it "renders" do
    render
  end
end
