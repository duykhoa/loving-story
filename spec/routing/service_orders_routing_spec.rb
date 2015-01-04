require "rails_helper"

RSpec.describe ServiceOrdersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/service_orders").to route_to("service_orders#index")
    end

    it "routes to #new" do
      expect(:get => "/service_orders/new").to route_to("service_orders#new")
    end

    it "routes to #show" do
      expect(:get => "/service_orders/1").to route_to("service_orders#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/service_orders/1/edit").to route_to("service_orders#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/service_orders").to route_to("service_orders#create")
    end

    it "routes to #update" do
      expect(:put => "/service_orders/1").to route_to("service_orders#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/service_orders/1").to route_to("service_orders#destroy", :id => "1")
    end

  end
end
