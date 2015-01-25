require 'rails_helper'

RSpec.describe "pages/index", :type => :view do
  before(:each) do
    assign(:pages, [
      Page.create!(
        :name => "Name",
        :content => "MyText",
        :slug => "Slug"
      ),
      Page.create!(
        :name => "Name",
        :content => "MyText",
        :slug => "Slug"
      )
    ])
  end

  it "renders a list of pages" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end
