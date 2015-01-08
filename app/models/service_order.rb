class ServiceOrder < ActiveRecord::Base
  enum status: [ :pending, :approve, :reject]

  validates :his_name, :her_name, :his_story, :her_story, presence: true
  validates :status, inclusion: { in: statuses, message: 'status is invalid' }, allow_nil: true
  validates :email, email: true
end
