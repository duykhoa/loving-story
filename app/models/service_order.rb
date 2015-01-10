class ServiceOrder < ActiveRecord::Base
  enum status: [ :pending, :approve, :reject]

  validates :his_name, :her_name, :his_story, :her_story, :our_relationship, :your_name, presence: true
  validates :status, inclusion: { in: statuses, message: 'status is invalid' }, allow_nil: true
  validates :email, email: true

  has_attached_file :header_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :header_image, :content_type => /\Aimage\/.*\Z/

end
