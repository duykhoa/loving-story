require 'rails_helper'

describe ServiceOrder do
  it { should validate_presence_of(:his_name) }
  it { should validate_presence_of(:her_name) }
  it { should validate_presence_of(:his_story) }
  it { should validate_presence_of(:her_story) }
  it { should validate_presence_of(:our_relationship) }
  it { should validate_presence_of(:your_name) }
  it { should have_attached_file(:header_image) }
  # it { should validate_attachment_presence(:header_image) }
  it { should validate_attachment_content_type(:header_image).
          allowing('image/png', 'image/gif', 'image/jpg').
          rejecting('text/plain', 'text/xml') }
  # it { should validate_attachment_size(:header_image).
  #         less_than(2.megabytes) }

  describe "validates status inclusion" do
    let(:service_order) { build(:service_order) }

    context "valid status" do
      let(:statuses) { ServiceOrder.statuses }

      it "create new service_order successfully" do
        statuses.each do |key, value|
          service_order.status = key
          expect(service_order.valid?).to be true
        end
      end
    end

    context "invalid status" do
      let(:invalid_statuses) { [-1, 3, "ABC"] }

      it "create new service_order successfully" do
        invalid_statuses.each do |status|
          expect { service_order.status = status }.to raise_error(ArgumentError)
        end
      end
    end
  end
end
