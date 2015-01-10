class AddAttachmentHeaderImageToServiceOrders < ActiveRecord::Migration
  def self.up
    change_table :service_orders do |t|
      t.attachment :header_image
    end
  end

  def self.down
    remove_attachment :service_orders, :header_image
  end
end
