module ServiceOrdersControllerConcern
  extend ActiveSupport::Concern

  def service_order_id(subdomain)
    id, _ = subdomain.split '.'
    id
  end
end
