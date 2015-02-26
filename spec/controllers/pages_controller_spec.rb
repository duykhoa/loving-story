require 'rails_helper'

RSpec.describe PagesController, :type => :controller do
  describe "GET show" do
    it "assigns the requested page as @page" do
      get :show, {:id => page.name}
      expect(assigns(:page)).to eq(page)
    end
  end
end
