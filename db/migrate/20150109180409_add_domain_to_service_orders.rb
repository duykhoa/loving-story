class AddDomainToServiceOrders < ActiveRecord::Migration
  def change
    add_column :service_orders, :domain, :string
  end
end
