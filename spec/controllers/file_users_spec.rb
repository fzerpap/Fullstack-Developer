require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  
  let!(:user) { create(:user) }
  let!(:admin) { create(:admin) }
  let!(:file_users) { create(:file_users_valids) }
  

  before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in admin
  end

  describe 'user autorized for import users' do
      context 'valid' do
        before(:each) { subject { post :create, params: {file_user: attributes_for(:file_users_with_errors) }}}
  
        it 'sucess, saves and assigns new file_user @file_user' do
          expect(FileUser.count).to eq(1)  
        end
      end

      context 'when invalid' do
        before(:each) { post :create, 
            params: {user: {name: ActionDispatch::Http::UploadedFile.new(:tempfile => File.new("#{Rails.root}/spec/fixtures/users_with_errors.xlsx"),
            filename: 'users_with_errorsXXX.xlsx') }}}
   
        it 'fails and assigns user to @user' do
          expect(FileUser.count).to eq(1)
        end
      end
  end


  describe 'user not autorized for CRUD' do

    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in user
    end

    subject { post :create, params: {file_user: attributes_for(:file_users_with_errors) }}
    it { expect(response).to render_template(nil) }


  end

end