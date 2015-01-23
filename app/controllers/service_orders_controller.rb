class ServiceOrdersController < ApplicationController
  layout 'service_orders'
  include ServiceOrdersControllerConcern

  before_action :set_service_order, only: [:edit, :update, :destroy]
  before_action :set_service_order_for_show_action, only: [:show]

  # GET /service_orders
  # GET /service_orders.json
  def index
    @service_orders = ServiceOrder.all
  end

  # GET /service_orders/1
  # GET /service_orders/1.json
  def show
  end

  # GET /service_orders/new
  def new
    @service_order = ServiceOrder.new
    render layout: "application"
  end

  # GET /service_orders/1/edit
  def edit
  end

  # POST /service_orders
  # POST /service_orders.json
  def create
    @service_order = ServiceOrder.new(service_order_params)

    respond_to do |format|
      if @service_order.save
        format.html { redirect_to @service_order, notice: 'Service order was successfully created.' }
        format.json { render :show, status: :created, location: @service_order }
      else
        format.html { render :new }
        format.json { render json: @service_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_orders/1
  # PATCH/PUT /service_orders/1.json
  def update
    #respond_to do |format|
      #if @service_order.update(service_order_params)
        #format.html { redirect_to @service_order, notice: 'Service order was successfully updated.' }
        #format.json { render :show, status: :ok, location: @service_order }
      #else
        #format.html { render :edit }
        #format.json { render json: @service_order.errors, status: :unprocessable_entity }
      #end
    #end
  end

  # DELETE /service_orders/1
  # DELETE /service_orders/1.json
  def destroy
    @service_order.destroy
    respond_to do |format|
      format.html { redirect_to service_orders_url, notice: 'Service order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_order
      @service_order = ServiceOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_order_params
      params.require(:service_order).permit(:email, :his_name, :her_name, :his_story, :her_story, :status, :our_relationship, :your_name, :domain, :header_image)
    end

    def set_service_order_for_show_action
      @service_order = ServiceOrder.find service_order_id(request.subdomain)
    end
end
