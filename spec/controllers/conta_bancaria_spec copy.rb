require 'rails_helper'

RSpec.describe ContaBancariaController, type: :controller do
  
  let!(:empresas) { create_list(:empresa, 2) }
  let!(:banco) { create(:banco, empresa_id: empresas[0].id) }
  let!(:conta_bancaria) { create_list(:conta_bancarium, 3, banco_id: banco.id) }
  let!(:transacao_bancarium) { create(:transacao_bancarium, conta_bancarium_id: conta_bancaria[0].id) }
  let!(:user) { create(:user, empresa_id: empresas[0].id ) }

  before do
      @request.env["devise.mapping"] = Devise.mappings[:empresa_administrator]
      sign_in user
  end

  describe '#index' do
    subject { get :index }

    it_behaves_like "renderable action", :index


    #it 'success' do
    #  expect(response).to be_successful 
    #end

    it 'assigns conta_bancaria to @conta_bancaria, for user, empresa[0]' do
      subject
      expect(assigns(:conta_bancaria)).to eq(conta_bancaria) 
    end

    it 'assigns conta_bancaria to @conta_bancaria, for user, empresa[1]' do
      user.update_column(:empresa_id, empresas[1].id)  
      subject 
      expect(assigns(:conta_bancaria)).to eq([]) 
    end
  end

  describe '#show' do
    context 'when requested conta_bancarium exists' do
      before(:each) { get :show, params: {id: conta_bancaria[0].id} }

      #it 'success' do
      #  expect(response.status).to eq(204)
      #end

      it_behaves_like "renderable action", :show

      it 'assigns it to @conta_bancarium' do
        expect(assigns(:conta_bancarium)).to eq(conta_bancaria[0])
        expect(response).to render_template show
      end
    end

    context 'when requested conta_bancarium does not exists' do
      it 'throws ActiveRecord::RecordNotFound' do
        expect { get :show, params: {id: -1} }.to raise_exception ActiveRecord::RecordNotFound
      end
    end
  end

  describe '#create' do
    context 'valid' do
      
      #subject { post :create, params: {banco: attributes_for(:banco_mega).merge({country_id: country.id})}}
      #let(:banco_params) {attributes_for(:banco_mega).merge({country_id: country.id})}
      #subject { post :create, banco: banco_attrs }

      #subject { post :create, params: { banco: banco_params } }
      #subject { post :create, params: banco_params }
      

      #subject { post :create, params: { nome: 'Test', cnpj: 'CNPJ-99', cep: '1212'}.merge({country_id: country.id}) }

      it 'sucess, saves and assigns new conta_bancarium to @conta_bancarium' do
        #new_banco = build(:banco, nome: 'Test', country_id: country.id)
        #post :create, new_banco.attributes
        
        subject {post :create, params: {conta_bancarium: { nro_agencia: 9999, nro_conta: 9999, 
                                                          banco_id: banco.id} } }

        expect(subject.to change(ContaBancarium, :count).by(1))  
        expect(response).to be_success

        #banco_mega = assigns(:banco)

        #expect(assigns(:banco)).to be_persisted
        #expect(banco_mega.nome).to eq('Mega')
        expect(assigns(:conta_bancarium)).to eq(9999)
      end
    end

    context 'when invalid' do
      subject { post :create, conta_bancarium: {nro_conta: nil} }

      it 'fails and assigns conta_bancarium to @conta_bancarium' do
        #expect(response).to be_success
        #expect(assigns(:banco)).to be_kind_of ActiveRecord::Base
        #expect(assigns(:banco).nome).to eq('')
        expect(response.status).to eq 200
        expect(response).to render_template :new
      end
    end
  end

  describe '#update' do
    let(:conta_bancarium_params) { {} }
    before(:each) { put :update, params: { id: conta_bancarium.id, conta_bancarium: conta_bancarium_params } }

    context 'with valid params' do
      let(:conta_bancarium_params) { { nro_conta: 9999999 } }

      it 'updates requested record' do
        expect(conta_bancarium.reload.nro_conta).to eq(conta_bancarium_params[:nro_conta])
      end
    end

    context 'with invalid params' do
      let(:conta_bancarium_params) { { nro_conta: nil } }
      it 'not updates requested record' do
        expect(conta_bancarium.reload.nro_conta).not_to eq(conta_bancarium_params[:nro_conta])
      end
    end
  end

  describe '#destroy' do
    
    context 'when requested conta_bancarium exists' do

     it 'removes conta_bancarium form DB' do
        delete :destroy, id: conta_bancaria[1].id 
        expect(ContaBancarium.all).not_to include conta_bancarium
        expect { conta_bancarium.reload }.to raise_exception ActiveRecord::RecordNotFound
      end

     it 'not removes conta_bancarium form DB' do
        delete :destroy, id: conta_bancaria[0].id 
        expect(ContaBancarium.all).to include conta_bancarium
      end
    end

    context 'when requested conta_bancarium does not exists' do
      it 'throws ActiveRecord::RecordNotFound' do
        expect { delete :destroy, id: -1 }.to raise_exception ActiveRecord::RecordNotFound
      end
    end
  end 
   

end