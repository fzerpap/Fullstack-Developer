require 'rails_helper'

describe Currency , type: :model do
  let!(:currency) { create(:currency) }
  let!(:currency1) { create(:currency) }
  let!(:country) { create(:country) }

  describe 'associations' do
    subject {currency}
    it { should have_many(:countries) }
  end

  describe 'validations' do
    subject {currency}
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'method save_to_delete' do
    context 'case false' do
        before { country.update_column(:currency_id, currency.id)  }
        subject { currency.destroy }
        it { is_expected.to be_falsy }
    end
    context 'case true' do
        before { country.update_column(:currency_id, currency1.id)  }
        subject { currency.destroy }
        it { is_expected.to be_truthy }
    end
  end

end