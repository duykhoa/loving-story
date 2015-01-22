class AddAttachmentHeaderImageToServiceOrders < ActiveRecord::Migration
  def self.up
    add_attachment :service_orders, :header_image
  end

  def self.down
    remove_attachment :service_orders, :header_image
  end
end
