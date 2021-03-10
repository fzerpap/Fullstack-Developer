require 'rails_helper'

describe Banco do
  let(:empresas) { create_list(:empresa,2) }
  let(:bancos) { create_list(:banco, 2) }
  let(:conta_bancarium) { create(:conta_bancarium ) }
  
  
  describe 'associations' do
    subject {bancos[0]}
    it { should belong_to(:empresa) }
    it { should have_many(:conta_bancaria) }
    it { should have_many(:cartao_creditos) }
  end

  describe 'validations' do
    subject {bancos[0]}
    it { should validate_presence_of(:nome) }
    it { should validate_presence_of(:cep) }
    it { should validate_presence_of(:empresa_id) }
    it { should validate_uniqueness_of(:nome) }
  end

  # Methods's Test
  describe 'method save_to_delete' do
    context 'case false' do
        before { conta_bancarium.update_column(:banco_id, bancos[0].id)  }
        subject { bancos[0].destroy }
        it { is_expected.to be_falsy }
    end
    context 'case true' do
        before { conta_bancarium.update_column(:banco_id, bancos[1].id)  }
        subject { bancos[0].destroy }
        it { is_expected.to be_truthy }
    end
  end
  describe 'method self.xempresa(empresa_id)' do
    context 'with empresa[0]' do
        before { bancos.each { |banco| banco.update_column(:empresa_id, empresas[0].id) }}
        subject { Banco.xempresa(empresas[0].id).count }
        it { is_expected.to eq(2) }
    end
    context 'with empresa[1]' do
      subject { Banco.xempresa(empresas[1].id).count }
      it { is_expected.to eq(0) }
    end
  end

end