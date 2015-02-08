require 'rails_helper'

describe Setting, :type => :model do
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