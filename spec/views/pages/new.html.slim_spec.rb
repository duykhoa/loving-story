require 'rails_helper'

RSpec.describe "pages/new", :type => :view do
  before(:each) do
    assign(:page, Page.new(
      :name => "MyString",
      :content => "MyText",
      :slug => "MyString"
    ))
  end

  it "renders new page form" do
    render

    assert_select "form[action=?][method=?]", pages_path, "post" do

      assert_select "input#page_name[name=?]", "page[name]"

      assert_select "textarea#page_content[name=?]", "page[content]"

      assert_select "input#page_slug[name=?]", "page[slug]"
    end
  end
end
