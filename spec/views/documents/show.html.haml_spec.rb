require 'rails_helper'

RSpec.describe "documents/show", type: :view do
  before(:each) do
    @document = assign(:document, Document.create!(
      :author => "Author",
      :dateline => "Dateline",
      :title => "Title",
      :subtitle => "Subtitle",
      :body_html => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/Dateline/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Subtitle/)
    expect(rendered).to match(/MyText/)
  end
end
