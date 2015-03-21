require 'rails_helper'

RSpec.describe Admin::ServiceOrdersController, :type => :controller do
  let(:user) { create(:admin_user) }

  describe "GET index" do
    it "responds successfully with an HTTP 200 status code" do
      sign_in user
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "assigns @service" do
      sign_in user
      order1 = FactoryGirl.create(:service_order, domain: "happy")
      order2 = FactoryGirl.create(:service_order, domain: "mylove")
      get :index
      expect(assigns(:service)).to eq([order2, order1])
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
