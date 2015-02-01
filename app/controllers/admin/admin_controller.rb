class Admin::AdminController < ActionController::Base
  before_action :authenticate_admin_user!
  protect_from_forgery with: :exception
end
