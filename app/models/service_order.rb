class ServiceOrder < ActiveRecord::Base
  enum status: [ :pending, :approve, :reject]

  validates :email, :his_name, :her_name, :his_story, :her_story, presence: true
end
