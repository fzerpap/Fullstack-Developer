require 'rails_helper'

describe EmpresasController, type: :controller do
  let!(:country) { create(:country) }
  let!(:empresa1) { create(:empresa) }
  let!(:empresa2) { create(:empresa) }
  let!(:user) { create(:user, empresa_id: empresa1.id ) }

  before do
      @request.env["devise.mapping"] = Devise.mappings[:empresa_administrator]
      sign_in user
  end

  describe '#index' do
    #before(:each) { get :index }
    subject { get :index }

    it 'success' do
      expect(response).to be_successful 
    end

    it 'assigns empresas to @empresas, for empresa of empresa1' do
      subject
      expect(assigns(:empresas)).to eq([empresa1]) 
    end

    it 'assigns empresas to @empresas, for empresa of empresa2' do
      user.update_column(:empresa_id, empresa2.id)  
      subject 
      expect(assigns(:empresas)).to eq([empresa2]) 
    end
  end

  describe '#show' do
    context 'when requested empresa exists' do
      before(:each) { get :show, params: {id: empresa1.id} }

      it 'success' do
        expect(response).to be_success
      end

      it 'assigns it to @empresa' do
        expect(assigns(:empresa)).to eq(empresa1)
      end
    end

    context 'when requested empresa does not exists' do
      it 'throws ActiveRecord::RecordNotFound' do
        expect { get :show, params: {id: -1} }.to raise_exception ActiveRecord::RecordNotFound
      end
    end
  end

  describe '#create' do
    context 'valid' do
      
      #subject { post :create, params: {empresa: attributes_for(:empresa_mega).merge({country_id: country.id})}}
      #let(:empresa_params) {attributes_for(:empresa_mega).merge({country_id: country.id})}
      #subject { post :create, empresa: empresa_attrs }

      #subject { post :create, params: { empresa: empresa_params } }
      #subject { post :create, params: empresa_params }
      

      #subject { post :create, params: { nome: 'Test', cnpj: 'CNPJ-99', cep: '1212'}.merge({country_id: country.id}) }

      it 'sucess, saves and assigns new empresa to @empresa' do
        #new_empresa = build(:empresa, nome: 'Test', country_id: country.id)
        #post :create, new_empresa.attributes
        
        subject {post :create, empresa: { nome: 'Test', cnpj: 'CNPJ-99', cep: '1212', caixa_principal_saldo: 0,
        caixa_troco_saldo: 0, data_inicio_saldo: nil, country_id: country.id} }


        expect(response).to be_success

        #empresa_mega = assigns(:empresa)

        #expect(assigns(:empresa)).to be_persisted
        #expect(empresa_mega.nome).to eq('Mega')
        expect(assigns(:empresa)).to eq('Test1')
      end
    end

    context 'when invalid' do
      subject { post :create, empresa: {nome: ""} }

      it 'fails and assigns empresa to @empresa' do
        #expect(response).to be_success
        #expect(assigns(:empresa)).to be_kind_of ActiveRecord::Base
        #expect(assigns(:empresa).nome).to eq('')
        expect(response.status).to eq 200
        expect(response).to render_template :new
      end
    end
  end

  describe '#update' do
    let(:empresa_params) { {} }
    before(:each) { put :update, params: { id: empresa1.id, empresa: empresa_params } }

    context 'with valid params' do
      let(:empresa_params) { { nome: 'Empresa-99' } }

      it 'updates requested record' do
        expect(empresa1.reload.nome).to eq(empresa_params[:nome])
      end
    end

    context 'with invalid params' do
      let(:empresa_params) { { nome: nil } }
      it 'not updates requested record' do
        expect(empresa1.reload.nome).not_to eq(empresa_params[:nome])
      end
    end
  end

  describe '#destroy' do
    
    context 'when requested empresa exists' do

     it 'removes empresa form DB' do
        delete :destroy, id: empresa2.id 
        expect(Empresa.all).not_to include empresa2
        expect { empresa2.reload }.to raise_exception ActiveRecord::RecordNotFound
      end

     it 'not removes empresa form DB' do
        delete :destroy, id: empresa1.id 
        expect(Empresa.all).to include empresa1
      end
    end

    context 'when requested empresa does not exists' do
      it 'throws ActiveRecord::RecordNotFound' do
        expect { delete :destroy, id: -1 }.to raise_exception ActiveRecord::RecordNotFound
      end
    end
  end 
  
end