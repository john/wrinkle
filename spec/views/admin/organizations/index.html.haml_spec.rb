require 'rails_helper'

RSpec.describe "admin/organizations/index", type: :view do
  before(:each) do
    assign(:organizations, [
      Organization.create!(
        :name => "Name",
        :slug => "Slug",
        :description => "MyText"
      ),
      Organization.create!(
        :name => "Name",
        :slug => "Slug",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of organizations" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
