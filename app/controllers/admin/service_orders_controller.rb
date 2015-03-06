class Admin::ServiceOrdersController < Admin::AdminController
  before_action :set_service_order, only: [:edit, :update, :destroy]
  layout 'admin'

  def index
    @service = ServiceOrder.order(created_at: :desc)
  end

  def edit
  end

  def update
    @service.update service_order_params
    redirect_to admin_service_orders_url
  end

  def destroy
    @service.destroy
    redirect_to admin_service_orders_url
  end

  private
    def set_service_order
      @service = ServiceOrder.unscoped.find(params[:id])
    end

    def service_order_params
      params.require(:service_order).permit(:email, :his_name, :her_name, :his_story, :her_story, :status)
    end
end
