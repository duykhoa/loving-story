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

  describe ".map_data" do
    let!(:settings) { create_list(:setting, 10) }
    let(:data) { Setting.map_data }

    context "over look of setting data" do
      it "returns 10 setting items" do
        expect(data.keys.count).to eq(10)
      end

      it "return an array of 10 hash" do
        expect(data).to be_a(Hash)
      end
    end

    context "when get value of a setting" do
      let!(:custom_setting) { create(:setting, key: "custom_key", value: "CUSTOM VALUE") }

      it "returns value of custom_setting" do
	value = data[:custom_key]
	expect(value).to eq("CUSTOM VALUE")
      end
    end
  end

  describe "value_of" do
    let(:setting_datas) { { key1: "value1", key2: "value2" } }

    before do
      allow(Setting).to receive(:fetch_cached).and_return(setting_datas)
    end

    context "when call an existed key" do
      it "returns value of key1" do
        expect(Setting.value_of(key_name: :key1)).to eq("value1")
      end
    end

    context "when call an non exist key" do
      it "returns value of key3" do
        expect(Setting.value_of(key_name: :key3)).to be_nil
      end
    end
  end
end
