require 'rails_helper'

describe Setting, :type => :model do
  describe ".cached_settings" do
    before do
      allow(Rails).to receive_message_chain(:cache, :fetch).and_return([])
      Setting.cached_settings
    end

    it "calls Rails.cache" do
      expect(Rails).to have_received(:cache).once
    end
  end

  describe "map_data" do
    let!(:settings) { create_list(:setting, 10) }
    let(:data) { Setting.map_data }

    it "returns 10 setting items" do
      expect(data.count).to eq(10)
    end

    it "return an array of 10 hash" do
      expect(data.first).to be_a(Hash)
    end
  end
end
