require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Fields' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:first_name).of_type(:string) }
    it { is_expected.to have_db_column(:last_name).of_type(:string) }
    it { is_expected.to have_db_column(:phone_number).of_type(:string) }

    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:phone_number) }
  end

  describe '#password_complexity' do
    context 'when password is valid' do
      let(:user) { build(:user, password: 'Password1') }

      it 'does not add any errors' do
        user.valid?
        expect(user.errors[:password]).to be_empty
      end
    end

    context 'when password is invalid' do
      let(:user) { build(:user, password: 'password') }

      it 'adds an error' do
        user.valid?
        expect(user.errors[:password]).to include('Пароль має містити хоча б одну велику літеру та не повинен містити пробілів')
      end
    end
  end
end
