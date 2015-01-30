require 'rails_helper'

RSpec.describe "settings/show", :type => :view do
  before(:each) do
    @setting = assign(:setting, Setting.create!(
      :key => "Key",
      :value => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Key/)
    expect(rendered).to match(/MyText/)
  end
end
