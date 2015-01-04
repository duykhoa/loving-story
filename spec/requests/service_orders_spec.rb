require 'rails_helper'

RSpec.describe "ServiceOrders", :type => :request do
  describe "GET /service_orders" do
    it "works! (now write some real specs)" do
      get service_orders_path
      expect(response).to have_http_status(200)
    end
  end
end
