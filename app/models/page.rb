class Page < ActiveRecord::Base
  validates :name, :content, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged
end
