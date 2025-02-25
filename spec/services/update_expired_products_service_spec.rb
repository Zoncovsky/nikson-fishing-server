require 'rails_helper'

RSpec.describe UpdateExpiredProductsService do
  subject(:service) do
    described_class.new(expired_products)
  end

  let(:expired_products) { [expired_product_one, expired_product_two] }
  let(:expired_product_one) { create(:product, is_new_arrival: true, created_at: 2.week.ago) }
  let(:expired_product_two) { create(:product, is_new_arrival: true, created_at: 2.week.ago) }

  describe '#call' do
    it 'update is_new_arrivals to false' do
      expect { service.call }.to change(Product, :count).by(2)

      expect(expired_product_one.is_new_arrival).to eq(false)
      expect(expired_product_two.is_new_arrival).to eq(false)
    end
  end
end
