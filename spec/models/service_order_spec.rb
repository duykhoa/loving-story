require 'rails_helper'

describe ServiceOrder do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:his_name) }
  it { should validate_presence_of(:her_name) }
  it { should validate_presence_of(:his_story) }
  it { should validate_presence_of(:her_story) }
end
