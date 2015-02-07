class HomesController < ApplicationController
  include HomesHelper
  def index
    @settings = Setting.cached_settings
  end
end
