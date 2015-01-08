require 'rails_helper'

RSpec.describe ServiceOrder, :type => :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:his_name) }
  it { should validate_presence_of(:her_name) }
  it { should validate_presence_of(:his_story) }
  it { should validate_presence_of(:her_story) }
end
