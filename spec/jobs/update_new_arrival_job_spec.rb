require 'rails_helper'

RSpec.describe UpdateNewArrivalJob do
  let(:products) { create_list(:product, 2, is_new_arrival: true, created_at: 2.week.ago) }
  let(:fake_service) { double }

  describe '#perform' do
    it 'calls UpdateExpiredProductsService' do
      expect(UpdateExpiredProductsService).to receive(:new)
        .with(products).and_return(fake_service)

      expect(fake_service).to receive(:call)

      described_class.perform_now
    end
  end
end
