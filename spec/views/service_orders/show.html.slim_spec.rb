require 'rails_helper'

RSpec.describe "service_orders/show", :type => :view do
  before(:each) do
    @service_order = assign(:service_order, ServiceOrder.create!(
      :email => "Email",
      :his_name => "His Name",
      :her_name => "Her Name",
      :his_story => "MyText",
      :her_story => "MyText",
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/His Name/)
    expect(rendered).to match(/Her Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Status/)
  end
end
