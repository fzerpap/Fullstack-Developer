require 'rails_helper'

describe Country do
  let(:country) { create(:country) }
  let(:country1) { create(:country) }
  let(:empresa) { create(:empresa) }

  describe 'associations' do
    subject {country}
    it { should belong_to(:currency) }
    it { should belong_to(:language) }
    it { should have_many(:empresas) }
  end

  describe 'validations' do
    subject {country}
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:currency_id) }
    it { should validate_presence_of(:language_id) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'method save_to_delete' do
    context 'case false' do
        before { empresa.update_column(:country_id, country.id)  }
        subject { country.destroy }
        it { is_expected.to be_falsy }
    end
    context 'case true' do
        before { empresa.update_column(:country_id, country1.id)  }
        subject { country.destroy }
        it { is_expected.to be_truthy }
    end
  end

end