require 'spec_helper'

describe Admin::UsersController do

  def mock_user(stubs={})
    (@mock_user ||= mock_model(User).as_null_object).tap do |user|
      stubs.each_key do |method_name|
        allow(user).to receive(method_name).and_return(stubs[method_name])
      end
    end
  end

  before { allow(controller).to receive(:require_admin) }

  describe "GET index" do
    it "assigns all users as @users" do
      allow(controller).to receive(:find_users).and_return([mock_user])
      get :index
      expect(assigns(:users)).to eq([mock_user])
    end
  end

  describe "GET show" do
    it "assigns the requested user as @user" do
      allow(User).to receive(:find).with("37") { mock_user }
      get :show, :id => "37"
      expect(assigns(:user)).to be(mock_user)
    end
  end

  
  describe "GET new" do
    it "assigns a new user as @user" do
      allow(User).to receive(:new) { mock_user }
      get :new
      expect(assigns(:user)).to be(mock_user)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created user as @user" do
        allow(User).to receive(:new).with({'these' => 'params'}) { mock_user(:save => true) }
        post :create, :user => {'these' => 'params'}
        expect(assigns(:user)).to be(mock_user)
      end

      it "redirects to the created user" do
        allow(User).to receive(:new) { mock_user(:save => true) }
        post :create, :user => {}
        expect(response).to redirect_to(admin_users_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        allow(User).to receive(:new).with({'these' => 'params'}) { mock_user(:save => false) }
        post :create, :user => {'these' => 'params'}
        expect(assigns(:user)).to be(mock_user)
      end

      it "re-renders the 'new' template" do
        allow(User).to receive(:new) { mock_user(:save => false) }
        post :create, :user => {}
        expect(response).to render_template("new")
      end
    end

  end
  
  
  describe "GET edit" do
    it "assigns the requested user as @user" do
      allow(User).to receive(:find).with("37") { mock_user }
      get :edit, :id => "37"
      expect(assigns(:user)).to be(mock_user)
    end
  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested user" do
        expect(User).to receive(:find).with("37") { mock_user }
        expect(mock_user).to receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :user => {'these' => 'params'}
      end

      it "assigns the requested user as @user" do
        allow(User).to receive(:find) { mock_user(:update_attributes => true) }
        put :update, :id => "1"
        expect(assigns(:user)).to be(mock_user)
      end

      it "redirects to the user" do
        allow(User).to receive(:find) { mock_user(:update_attributes => true) }
        put :update, :id => "1"
        expect(response).to redirect_to(admin_users_url)
      end
    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        allow(User).to receive(:find) { mock_user(:update_attributes => false) }
        put :update, :id => "1"
        expect(assigns(:user)).to be(mock_user)
      end

      it "re-renders the 'edit' template" do
        allow(User).to receive(:find) { mock_user(:update_attributes => false) }
        put :update, :id => "1"
        expect(response).to render_template("edit")
      end
    end

  end
  
  describe "DELETE destroy" do
    it "destroys the requested user" do
      expect(User).to receive(:find).with("37") { mock_user }
      expect(mock_user).to receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the users list" do
      allow(User).to receive(:find) { mock_user }
      delete :destroy, :id => "1"
      expect(response).to redirect_to(admin_users_url)
    end
  end

end

