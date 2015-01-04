class CreateServiceOrders < ActiveRecord::Migration
  def change
    create_table :service_orders do |t|
      t.string :email
      t.string :his_name
      t.string :her_name
      t.text :his_story
      t.text :her_story
      t.string :status

      t.timestamps null: false
    end
  end
end
