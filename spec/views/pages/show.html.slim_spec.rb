require 'rails_helper'

RSpec.describe "pages/show", :type => :view do
  before(:each) do
    @page = assign(:page, Page.create!(
      :name => "Name",
      :content => "MyText",
      :slug => "Slug"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Slug/)
  end
end
