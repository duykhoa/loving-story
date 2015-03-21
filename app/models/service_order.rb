class ServiceOrder < ActiveRecord::Base
  enum status: [ :pending, :approve, :reject]

  default_scope { order(created_at: :desc) }

  validates :his_name, :her_name, :his_story, :her_story, :our_relationship, :your_name, presence: true
  validates :status, inclusion: { in: statuses, message: 'status is invalid' }, allow_nil: true
  validates :email, email: true
  validates :domain, uniqueness: true
  validates_format_of :domain, with: /\A([a-z0-9]|-){4,30}\Z/

  has_attached_file :header_image, { :styles => { :medium => "1200x800>" } }.merge(PaperclipStorageOption.options)
  validates_attachment_content_type :header_image, :content_type => /\Aimage\/.*\Z/

  def short_his_name
    his_name.split(" ").first
  end

  def short_her_name
    her_name.split(" ").first
  end

  def self.valid(attrs)
    object = new(attrs)
    object.valid?

    attrs.keys.map(&:to_sym).each do |key|
      return false if object.errors.messages.include?(key)
    end

    true
  end
end
