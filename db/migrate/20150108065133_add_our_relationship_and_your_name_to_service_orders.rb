class AddOurRelationshipAndYourNameToServiceOrders < ActiveRecord::Migration
  def change
    add_column :service_orders, :our_relationship, :text
    add_column :service_orders, :your_name, :string
  end
end
