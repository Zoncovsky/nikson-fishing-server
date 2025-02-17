require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'Fields' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:customer_email).of_type(:string) }
    it { is_expected.to have_db_column(:total).of_type(:integer) }
    it { is_expected.to have_db_column(:address).of_type(:string) }
    it { is_expected.to have_db_column(:city).of_type(:string) }
    it { is_expected.to have_db_column(:post_number).of_type(:string) }
    it { is_expected.to have_db_column(:comment).of_type(:text) }
    it { is_expected.to have_db_column(:status).of_type(:integer) }

    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe 'Associations' do
    it { is_expected.to have_many(:order_products) }
  end

  describe 'Enums' do
    let(:statuses) { %w[pending done] }

    it { is_expected.to define_enum_for(:status).with_values(statuses) }
  end
end
