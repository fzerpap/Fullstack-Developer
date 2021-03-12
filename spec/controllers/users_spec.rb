require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  
  let!(:users) { create_list(:user,5) }
  let!(:admin) { create(:admin) }

  before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in admin
  end

  describe 'user autorized for CRUD' do
    describe '#index' do
      before(:each) { get :index }

      it 'assigns users to @users' do
        expect(assigns(:users)).to eq(User.all) 
        expect(response).to render_template :index
      end

    end

    describe '#show' do
      context 'when requested user exists' do
        before(:each) { get :show, params: {id: users[0].id} }

        it 'assigns it to @user' do
          expect(assigns(:user)).to eq(users[0])
          expect(response).to render_template :show
        end
      end

    end

    describe '#create' do
      context 'valid' do
        before(:each) { post :create, params: {user: attributes_for(:user) }}
  
        it 'sucess, saves and assigns new user @user' do
          expect(User.count).to eq(6)  
        end
      end

      context 'when invalid' do
        before(:each) { post :create, params: {user: attributes_for(:user, full_name: nil) }}
        before(:each) { post :create, params: {user: { full_name: nil }}}

        it 'fails and assigns user to @user' do
          expect(response).to render_template :new
        end
      end
    end

    describe '#update' do

      context 'with valid params' do
        let(:user_params) { { full_name: "Full-Name-Umanni" } }
        subject { put :update, params: { id: User.last.id, user: user_params } }
        it 'updates requested record' do
          expect(User.last.full_name).to eq("Full-Name-Umanni")
        end
      end

      context 'with invalid params' do
        let(:user_params) { { full_name: nil } }
        subject { put :update, params: { id: users[0].id, user: user_params } }

        it 'not updates requested record' do
          expect(users[0].reload.full_name).not_to eq(user_params[:full_name])
        end
      end
    end

    describe '#destroy' do
      
      context 'when requested user exists' do
        subject { delete :destroy, id: User.last.id  }

        it 'removes user form DB' do
          expect {subject}.to change{User.count}.by(-1)
        end
      end
    end 
  end

  describe 'user not autorized for CRUD' do

    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in users[0]
    end

    context '#index' do
      subject { get :index }
      it { expect(response).to render_template(nil) }
      
      subject { get :show, params: {id: users[0].id}}
      it { expect(response).to render_template(nil) }

      subject { post :create, params: {user: attributes_for(:user) }}
      it { expect(response).to render_template(nil) }

      subject { put :update, params: { id: User.last.id, user: { full_name: "Full-Name-Umanni" } } }
      it { expect(response).to render_template(nil) }

      subject { delete :destroy, id: User.last.id  }
      it { expect(response).to render_template(nil) }

    end   
  end

end