require 'rails_helper'

RSpec.describe Admin::ServiceOrdersController, :type => :controller do
  let(:user) { create(:admin_user) }

  describe "GET index" do
    before do
      sign_in user
      get :index
    end

    context "get index pages" do
      it "responds successfully with an HTTP 200 status code" do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end

    context "get service_orders list" do
      it "assigns @service" do
        order1 = create(:service_order, domain: "happy")
        order2 = create(:service_order, domain: "mylove")
        expect(assigns(:service)).to eq([order2, order1])
      end
    end
  end

  describe "GET edit" do
    it "returns http found" do
      get :index
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET update" do
    it "returns http found" do
      get :index
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET destroy" do
    it "returns http found" do
      get :index
      expect(response).to have_http_status(:found)
    end
  end

end
