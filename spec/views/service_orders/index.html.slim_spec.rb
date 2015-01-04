require 'rails_helper'

RSpec.describe "service_orders/index", :type => :view do
  before(:each) do
    assign(:service_orders, [
      ServiceOrder.create!(
        :email => "Email",
        :his_name => "His Name",
        :her_name => "Her Name",
        :his_story => "MyText",
        :her_story => "MyText",
        :status => "Status"
      ),
      ServiceOrder.create!(
        :email => "Email",
        :his_name => "His Name",
        :her_name => "Her Name",
        :his_story => "MyText",
        :her_story => "MyText",
        :status => "Status"
      )
    ])
  end

  it "renders a list of service_orders" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "His Name".to_s, :count => 2
    assert_select "tr>td", :text => "Her Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
