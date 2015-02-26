require 'rails_helper'

describe Page do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:content) }

  describe "#create" do
    let(:page) { create(:page) }
    it "create new page" do
      expect(page).to be_a(Page)
    end
  end

  describe "initialize slug when create a page" do
    let(:page) { build(:page) }

    context "not save page" do
      it "slug is nil" do
        expect(page.slug).to be_nil
      end
    end

    context "save page" do
      before do
        page.save!
        page.reload
      end

      it "slug isn't nil" do
        expect(page.slug).not_to be_nil
      end
    end

    context "slug is encoded name string" do
      let(:page) { build(:page, name: 'Test page') }
      let(:page2) { build(:page, name: 'TEst$page') }

      before do
        page.save!
        page.reload

        page2.save!
        page2.reload
      end

      it "slug is generate by name" do
        expect(page.slug).to eq('test-page')
        expect(page2.slug).to match("test")
      end
    end
  end
end
