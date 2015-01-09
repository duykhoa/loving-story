class Admin::ServiceOrdersController < ApplicationController
  before_action :set_service_order, only: [:edit, :update, :destroy]
  layout 'admin'

  def index
    @service = ServiceOrder.all
  end

  def edit
  end

  def update
    respond_to do |format|
      if @service.update(service_order_params)
        format.html { redirect_to @service, notice: 'Service order was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to admin_service_orders_url, notice: 'Service order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_service_order
      @service = ServiceOrder.find(params[:id])
    end

    def service_order_params
      params.require(:service_order).permit(:email, :his_name, :her_name, :his_story, :her_story, :status)
    end

end
