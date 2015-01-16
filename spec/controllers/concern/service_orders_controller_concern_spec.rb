shared_examples ServiceOrdersControllerConcern do
  let(:subdomain) { "test-love-story.for4ever" }

  describe "return correct id" do
    it "returns test-love-story" do
      expect(controller.service_order_id subdomain).to eq("test-love-story")
    end
  end
end

describe ServiceOrdersController, type: :controller do
  include_examples ServiceOrdersControllerConcern
end
