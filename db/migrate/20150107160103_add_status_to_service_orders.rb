class AddStatusToServiceOrders < ActiveRecord::Migration
  def change
    add_column :service_orders, :status, :integer, default: 0
  end
end
