require 'rails_helper'

RSpec.describe PagesController, :type => :controller do
  describe "GET show" do
    let!(:page) { create(:page) }

    it "assigns the requested page as @page" do
      get :show, { id: page.name }

      expect(response.status).to eq(200)
    end
  end
end
