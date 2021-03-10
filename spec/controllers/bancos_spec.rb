require 'rails_helper'

describe BancosController, type: :controller do
  let(:empresa1) { create(:empresa_mega) }
  let(:empresa2) { create(:empresa) }
  let(:user) { create(:user, empresa_id: empresa1.id ) }
  let(:lista_bancos) { create_list(:banco, 3, empresa_id: empresa1.id) }

  before do
      @request.env["devise.mapping"] = Devise.mappings[:user_administrator]
      sign_in user
  end

  describe '#index' do
    before(:each) { get :index }

    context 'success' do
      it { expect(response).to be_successful }
    end

    context 'assigns bancos to @bancos, for user of empresa1' do
      it { expect(assigns(:bancos)).to eq(lista_bancos) }
    end

    context 'assigns bancos to @bancos, for user of empresa2' do
      before { user.update_column(:empresa_id, empresa2.id)  }
      it { expect(assigns(:bancos)).to eq([]) }
    end
  end

  describe '#show' do
    context 'when requested user exists' do
      before(:each) { get :show, id: lista_bancos[0].id }

      it 'success' do
        expect(response).to be_success
      end

      it 'assigns it to @user' do
        expect(assigns(:banco)).to eq(lista_bancos[0])
      end
    end

    context 'when requested user does not exists' do
      it 'throws ActiveRecord::RecordNotFound' do
        expect { get :show, id: -1 }.to raise_exception ActiveRecord::RecordNotFound
      end
    end
  end
=begin
  describe '#create' do
    before(:each) { post :create, ** user_attrs }

    context 'when valid' do
      let(:user_attrs) { attributes_for(:user) }

      it 'success' do
        expect(response).to be_success
      end

      it 'saves and assigns new user to @user' do
        user = assigns(:user)

        expect(user).to be_kind_of ActiveRecord::Base
        expect(user).to be_persisted
        expect(users).not_to include user
      end
    end

    context 'when invalid' do
      let(:user_attrs) { attributes_for(:invalid_user) }

      it 'fails' do
        expect(response).not_to be_success
      end

      it 'assigns user to @user' do
        expect(assigns(:user)).to be_kind_of ActiveRecord::Base
      end
    end
  end

  describe '#update' do
    let(:user) { create(:user) }
    before(:each) { patch :update, ** new_values, id: user.id }

    context 'when valid' do
      let(:new_values) { attributes_for(:user) }

      it 'success' do
        expect(response).to be_success
      end

      it 'saves and assigns user to @user' do
        expect(assigns(:user)).to eq user
      end

      it 'saves updates' do
        expect { user.reload }.to change { user.nick }.to(new_values[:nick])
      end
    end

    context 'when invalid' do
      let(:new_values) { attributes_for(:invalid_user) }

      it 'fails' do
        expect(response).not_to be_success
      end

      it 'assigns user to @user' do
        expect(assigns(:user)).to eq user
      end
    end
  end

  describe '#destroy' do
    context 'when requested user exists' do
      let(:user) { users[rand 4] }
      before(:each) { delete :destroy, id: user.id }

      it 'success' do
        expect(response).to be_success
      end

      it 'removes user form DB' do
        expect(User.all).not_to include user
        expect { user.reload }.to raise_exception ActiveRecord::RecordNotFound
      end
    end

    context 'when requested user does not exists' do
      it 'throws ActiveRecord::RecordNotFound' do
        expect { delete :destroy, id: -1 }.to raise_exception ActiveRecord::RecordNotFound
      end
    end
  end 
=end
end