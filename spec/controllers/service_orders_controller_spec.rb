require 'rails_helper'

RSpec.describe ServiceOrdersController, :type => :controller do
  let!(:service_order) { create(:service_order) }

  describe "GET show" do
    before do
      allow(request).to receive(:subdomain).and_return(service_order.domain)
    end

    it "assigns the requested service_order as @service_order" do
      get :show, {:id => service_order.domain}
      expect(assigns(:service_order)).to eq(service_order)
    end
  end

  describe "GET new" do
    it "assigns a new service_order as @service_order" do
      get :new
      expect(assigns(:service_order)).to be_a_new(ServiceOrder)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      let(:service_order) { build(:service_order) }
      let(:service_order_attributes) { service_order.attributes.merge("status" => "pending") }

      it "creates a new ServiceOrder" do
        expect {
          post :create, { service_order: service_order_attributes }
        }.to change(ServiceOrder, :count).by(1)
      end

      it "assigns a newly created service_order as @service_order" do
        post :create, { service_order: service_order_attributes }
        expect(assigns(:service_order)).to be_a(ServiceOrder)
        expect(assigns(:service_order)).to be_persisted
      end

      it "redirects to the created service_order" do
        post :create, {service_order: service_order_attributes}
        expect(response).to redirect_to(root_url(subdomain: "#{service_order.domain}.4ever"))
      end
    end

    describe "with invalid params" do
      let(:invalid_service_order_attributes) { { email: 'only-field@gmail.com' } }
      it "assigns a newly created but unsaved service_order as @service_order" do
        post :create, { service_order: invalid_service_order_attributes }
        expect(assigns(:service_order)).to be_a_new(ServiceOrder)
      end

      it "re-renders the 'new' template" do
        post :create, { service_order: invalid_service_order_attributes }
        expect(response).to render_template("new")
      end
    end
  end

end
