require 'rails_helper'
require 'view/support/authenticate'


describe 'Visitor faz login' do
  include_context 'Authenticate'
 
  context 'User' do
    let!(:user) { create(:user)}
    it 'entry to the home page' do
      visit '/users/sign_in'
      expect(page).to have_content('Esqueceou a Senha?')
    end

    it 'User sign in' do
      sign_in(user)
      expect(page).to have_content('Perfil do Usuário')
    end
  end

  context 'Admin' do
    let!(:admin) { create(:admin)}

    it 'User sign in' do
      sign_in(admin)
      expect(page).to have_content('Painel de Controle')
    end
  end


end


