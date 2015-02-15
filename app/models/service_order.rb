class ServiceOrder < ActiveRecord::Base
  enum status: [ :pending, :approve, :reject]

  validates :his_name, :her_name, :his_story, :her_story, :our_relationship, :your_name, presence: true
  validates :status, inclusion: { in: statuses, message: 'status is invalid' }, allow_nil: true
  validates :email, email: true
  validates :domain, uniqueness: true

  has_attached_file :header_image, :styles => { :medium => "1200x800>" },
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml")
  validates_attachment_content_type :header_image, :content_type => /\Aimage\/.*\Z/

  def short_his_name
    his_name.split(" ").first
  end

  def short_her_name
    her_name.split(" ").first
  end
end
