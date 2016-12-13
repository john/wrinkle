require 'rails_helper'

RSpec.describe "documents/index", type: :view do
  before(:each) do
    allow(view).to receive(:current_user).and_return( create(:user)  )

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

    assign(:services, {
      Quip: []
    })
  end

  it "renders" do
    render
  end
end
