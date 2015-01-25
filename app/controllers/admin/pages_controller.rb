class Admin::PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def index
    @dynamics = Page.all
  end

  def show
  end

  def new
    @dynamic = Page.new
  end

  def edit
  end

  def create
    @dynamic = Page.new(page_params)
    @dynamic.save
    redirect_to admin_page_path(@dynamic)
  end

  def update
    @dynamic.update(page_params)
    redirect_to admin_page_path
  end

  def destroy
    @dynamic.destroy
    redirect_to admin_pages_path
  end

  private
    def set_page
      @dynamic = Page.friendly.find(params[:id])
    end

    def page_params
      params.require(:page).permit(:name, :content, :slug)
    end
end
