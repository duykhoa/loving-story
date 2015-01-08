class AddChangecolumnStatus < ActiveRecord::Migration
  def change
    change_column_default :service_orders, :status, 'pending'
  end
end
