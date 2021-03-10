require 'rails_helper'

describe Empresa do
  let(:empresa) { FactoryGirl.create(:empresa) }
  let(:empresa_mega) { create(:empresa_mega) }
  let(:caixa_pdv) { create(:caixa_pdv) }

  describe 'associations' do
    subject {empresa}
    it { should belong_to(:country) }

    it { should have_many(:users) }
    it { should have_many(:bancos) }
    it { should have_many(:caixa_pdvs) }
    it { should have_many(:caixa_principals) }
    it { should have_many(:caixa_trocos) }
    it { should have_many(:fornecedors) }
    it { should have_many(:egressos) }
    it { should have_many(:funcionarios) }
    it { should have_many(:folha_debitos) }
    it { should have_many(:centro_custos) }

  end

  describe 'validations' do
    subject {empresa}
    it { should validate_presence_of(:nome) }
    it { should validate_presence_of(:country_id) }
    it { should validate_presence_of(:cnpj) }
    it { should validate_presence_of(:cep) }
    it { should validate_uniqueness_of(:nome) }
    it { should validate_uniqueness_of(:cnpj) }
  end

  describe 'method save_to_delete' do
    context 'case false' do
        before { caixa_pdv.update_column(:empresa_id, empresa.id)  }
        subject { empresa.destroy }
        it { is_expected.to be_falsy }
    end
    context 'case true' do
        before { caixa_pdv.update_column(:empresa_id, empresa_mega.id)  }
        subject { empresa.destroy }
        it { is_expected.to be_truthy }
    end
  end

end