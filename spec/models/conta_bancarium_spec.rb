require 'rails_helper'

describe ContaBancarium do
  let!(:empresas) { create_list(:empresa,2) }
  let!(:banco) { create(:banco, empresa_id: empresas[0].id) }
  let!(:conta_bancaria) { create_list(:conta_bancarium,3, banco_id: banco.id) }
  let!(:transacao_bancarium) { create(:transacao_bancarium, conta_bancarium_id: conta_bancaria[0].id ) }
  
  
  describe 'associations' do
    subject {conta_bancaria[0]}
    it { should belong_to(:banco) }
    it { should have_many(:transacao_bancaria) }
    it { should have_many(:caixa_principals) }
    it { should have_many(:conta_pagars) }
  end

  describe 'validations' do
    subject {conta_bancaria[0]}
    it { should validate_presence_of(:nro_agencia) }
    it { should validate_presence_of(:nro_conta) }
    it { should validate_presence_of(:banco_id) }
    it { should validate_uniqueness_of(:nro_conta) }
  end

  # Methods's Test
  describe 'method save_to_delete' do
    context 'case false' do
        #before { transacao_bancarium.update_column(:conta_bancarium_id, conta_bancaria[0].id)  }
        subject { conta_bancaria[0].destroy }
        it { is_expected.to be_falsy }
    end
    context 'case true' do
        before { transacao_bancarium.update_column(:conta_bancarium_id, conta_bancaria[1].id)  }
        subject { conta_bancaria[0].destroy }
        it { is_expected.to be_truthy }
    end
  end
  describe 'method self.xempresa(empresa_id)' do
    context 'with empresa[0]' do
        #before { conta_bancaria.each { |conta_bancarium| conta_bancarium.update_column(:banco_id, banco.id) }}
        subject { ContaBancarium.xempresa(empresas[0].id).count }
        it { is_expected.to eq(3) }
    end
    context 'with empresa[1]' do
      subject { Banco.xempresa(empresas[1].id).count }
      it { is_expected.to eq(0) }
    end
  end

end