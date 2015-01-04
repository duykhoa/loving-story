require 'rails_helper'

RSpec.describe "service_orders/new", :type => :view do
  before(:each) do
    assign(:service_order, ServiceOrder.new(
      :email => "MyString",
      :his_name => "MyString",
      :her_name => "MyString",
      :his_story => "MyText",
      :her_story => "MyText",
      :status => "MyString"
    ))
  end

  it "renders new service_order form" do
    render

    assert_select "form[action=?][method=?]", service_orders_path, "post" do

      assert_select "input#service_order_email[name=?]", "service_order[email]"

      assert_select "input#service_order_his_name[name=?]", "service_order[his_name]"

      assert_select "input#service_order_her_name[name=?]", "service_order[her_name]"

      assert_select "textarea#service_order_his_story[name=?]", "service_order[his_story]"

      assert_select "textarea#service_order_her_story[name=?]", "service_order[her_story]"

      assert_select "input#service_order_status[name=?]", "service_order[status]"
    end
  end
end
