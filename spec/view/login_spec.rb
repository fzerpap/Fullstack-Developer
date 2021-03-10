require 'rails_helper'


describe 'Visitante faz login' do
  let!(:role_administrator) { create(:role_administrator)}
  let!(:empresa) { create(:empresa)}
  let!(:country) { create(:country)}
  
  #let(:user) { create(:user, role_id: role_administrator.id)}
  let!(:user) { create(:user) }
  
  it 'entra a pagina principal' do
    visit '/'
    expect(page).to have_content('Esqueceou a Senha?')
  end

  it 'faz login' do
    visit '/'
    fill_in "login-username", with: 'username-1'
    fill_in "login-password", with: 'user12345678'
    click_button 'commit'
    expect(page).to have_content('username-1')
    #expect(page).to have_content(user.name)
  end


end


