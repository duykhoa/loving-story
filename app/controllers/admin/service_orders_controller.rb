class Admin::ServiceOrdersController < Admin::AdminController
  before_action :set_service_order, only: [:edit, :update, :destroy]
  layout 'admin'

  def index
    @service_order = ServiceOrder.page params[:page]
  end

  def edit
  end

  def update
    @service_order.update service_order_params
    redirect_to admin_service_orders_url
  end

  def destroy
    @service_order.destroy
    redirect_to admin_service_orders_url
  end

  private
    def set_service_order
      @service_order = ServiceOrder.unscoped.find(params[:id])
    end

    def service_order_params
      params.require(:service_order).permit(:email, :his_name, :her_name, :his_story, :her_story, :status)
    end
end
