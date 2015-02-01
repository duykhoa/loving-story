require 'rails_helper'

RSpec.describe Admin::PagesController, :type => :controller do

  describe "GET create" do
    it "returns http found" do
      get :index
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET new" do
    it "returns http found" do
      get :new
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET index" do
    it "returns http found" do
      get :index
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET show" do
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
