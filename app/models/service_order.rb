class ServiceOrder < ActiveRecord::Base
  validates :email, :his_name, :her_name, :his_story, :her_story, presence: true

  enum status: [ :pending, :approve, :reject]
end
