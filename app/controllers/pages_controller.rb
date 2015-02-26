class PagesController < ApplicationController
  before_action :set_page, only: [:show]

  def show
  end

  private

  def set_page
    @page = Page.friendly.find(page_id[:id])
  end

  def page_id
    params.permit(:id)
  end
end
