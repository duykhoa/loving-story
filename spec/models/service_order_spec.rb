require 'rails_helper'

describe ServiceOrder do
  DOMAIN_LIST =
    [
      'domain',
      'good-domain',
      'very-good-domain',
      'k'*4,
      'k'*30,
      'a12345bcd'
    ]

  INVALID_DOMAIN_LIST =
    [
      'Domain',
      'not_good0domain',
      'd3$#&',
      'k'*3,
      'k'*31
    ]

  it { should validate_presence_of(:his_name) }
  it { should validate_presence_of(:her_name) }
  it { should validate_presence_of(:his_story) }
  it { should validate_presence_of(:her_story) }
  it { should validate_presence_of(:our_relationship) }
  it { should validate_presence_of(:your_name) }
  it { should validate_uniqueness_of(:domain) }
  it { should have_attached_file(:header_image) }

  INVALID_DOMAIN_LIST.each do |domain_name|
    it { should_not allow_value(domain_name).for(:domain) }
  end

  DOMAIN_LIST.each do |domain_name|
    it { should allow_value(domain_name).for(:domain) }
  end

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

  describe ".valid" do
    context "validates 1 fields" do
      context "validates a valid domain name" do
        let(:domain) { 'gooddomain' }
        let(:domain2) { 'gooddomain-abc' }

        it "returns true" do
          expect(ServiceOrder.valid(domain: domain)).to be true
          expect(ServiceOrder.valid(domain: domain2)).to be true
        end
      end

      context "validates an invalid domain name" do
        let(:domain) { 'go##domain' }

        context "format error" do
          it "returns false" do
            expect(ServiceOrder.valid(domain: domain)).to be false
          end
        end

        context "domain existed" do
          before do
            create(:service_order, domain: "exist")
          end

          it "returns true" do
            expect(ServiceOrder.valid(domain: "not-exist")).to be true
          end

          it "returns false" do
            expect(ServiceOrder.valid(domain: "exist")).to be false
          end
        end
      end
    end

    context "validates more fields" do
      context "validates a valid domain name and email" do
        let(:valid_fields) { { domain: 'gooddomain', email: 'email@gmail.com' } }
        subject { ServiceOrder.valid(valid_fields) }

        it "returns true" do
          expect(subject).to be true
        end
      end

      context "validates fail for an existed domain name" do
        let(:invalid_fields1) { { domain: 'gooddomain', email: 'email@gmail.com' } }
        let(:invalid_fields2) { { domain: 'gooddomain2', email: 'invalid' } }

        before { create:service_order, domain: 'gooddomain' }

        it "returns false" do
          expect(ServiceOrder.valid(invalid_fields1)).to be false
        end

        it "returns false" do
          expect(ServiceOrder.valid(invalid_fields2)).to be false
        end
      end
    end
  end

  describe "default_scope" do
    let(:old_order) { create(:service_order, created_at: 1.day.ago, domain: "happy") }
    let(:new_order) { create(:service_order, created_at: 1.hour.ago, domain: "mylove") }

    it "orders by created time" do
      expect(ServiceOrder.all).to eq([new_order, old_order])
    end

  end
end
