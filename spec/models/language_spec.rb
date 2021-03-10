require 'rails_helper'

describe Language do
  let(:language) { create(:language) }
  let(:language1) { create(:language) }
  let(:country) { create(:country) }

  describe 'associations' do
    subject {language}
    it { should have_many(:countries) }
  end

  describe 'validations' do
    subject {language}
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'method save_to_delete' do
    context 'case false' do
        before { country.update_column(:language_id, language.id)  }
        subject { language.destroy }
        it { is_expected.to be_falsy }
    end
    context 'case true' do
        before { country.update_column(:language_id, language1.id)  }
        subject { language.destroy }
        it { is_expected.to be_truthy }
    end
  end

end