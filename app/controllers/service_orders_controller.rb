class ServiceOrdersController < ApplicationController
  include ServiceOrdersControllerConcern
  layout 'application'

  before_action :set_service_order, only: [:destroy]
  before_action :set_service_order_for_show_action, only: [:show]

  def show
    render layout: 'service_orders'
  end

  def new
    @service_order = ServiceOrder.new
  end

  def create
    @service_order = ServiceOrder.new(service_order_params)

    if @service_order.save
      redirect_to root_url(subdomain: "#{ @service_order.id }.4ever")
    else
      render :new
    end
  end

  private
    def set_service_order
      @service_order = ServiceOrder.find(params[:id])
    end

    def service_order_params
      params.require(:service_order).permit(:email, :his_name, :her_name, :his_story, :her_story, :status, :our_relationship, :your_name, :domain, :header_image)
    end

    def set_service_order_for_show_action
      @service_order = ServiceOrder.find service_order_id(request.subdomain)
    end
end
