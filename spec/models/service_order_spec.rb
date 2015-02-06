require 'rails_helper'

describe ServiceOrder do
  it { should validate_presence_of(:his_name) }
  it { should validate_presence_of(:her_name) }
  it { should validate_presence_of(:his_story) }
  it { should validate_presence_of(:her_story) }
  it { should validate_presence_of(:our_relationship) }
  it { should validate_presence_of(:your_name) }
  it { should have_attached_file(:header_image) }

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

  describe "#short_his_name" do
    let(:service_order) { build(:service_order, his_name: "Vu Tran") }

    context "valid short_his_name" do
      it "returns short_his_name" do
        expect(service_order.short_his_name).to eq("Vu")
      end
    end
  end

  describe "#short_her_name" do
    let(:service_order) { build(:service_order, her_name: "Vu Tran") }

    context "valid short_her_name" do
      it "returns short_her_name" do
        expect(service_order.short_her_name).to eq("Vu")
      end
    end
  end
end
