require 'rails_helper'


describe 'Visitor faz login' do
  let!(:user) { create(:user)}
  let!(:admin) { create(:admin)}
  
  it 'entry to the home page' do
    visit '/users/sign_in'
    expect(page).to have_content('Esqueceou a Senha?')
  end

  it 'faz login' do
    visit '/users/sign_in'
    fill_in "login-email", with: 'user-2@umanni.com.br'
    fill_in "login-password", with: 'user12345678'
    click_button 'commit'

    #expect(page).to have_content('Full-Name-User-2')
    expect(page).to have_content('Painel de Controle')
    
  end


end


