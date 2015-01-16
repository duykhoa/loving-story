require 'rails_helper'

RSpec.describe Admin::ServiceOrdersController, :type => :controller do

  describe "GET index" do
    it "returns http found" do
      get :index
      expect(response).to have_http_status(:found)
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
