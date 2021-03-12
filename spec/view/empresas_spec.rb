require 'rails_helper'

#feature 'Visitante acessa a empresas' do
describe 'Visitante acessa a empresas' do
  let(:country) { create(:country)}
  let(:empresa) { create(:empresa)}

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end

  it 'entra a pagina principal' do
    visit '/index'
    expect(page).to have_content('Logout')
  end

  it 'entra a pagina de empresas' do
    visit '/empresas'
    expect(page).to have_content('Lista de Empresas')
  end

  it 'entra a pagina de inserir uma nova empresa' do
    visit '/empresas/new'
    expect(page).to have_content('Nome')
  end

  it 'insirendo uma nova empresa' do
    visit '/empresas/new'
    within("#form-empresa") do
      select('Country-1', from: 'empresa_country_id')
      #fill_in "empresa_nome", with: SecureRandom.alphanumeric
      fill_in "empresa_nome", with: 'Supermecado MegaBom'
      fill_in "empresa_cnpj", with: '9999999999'
      fill_in "empresa_cep", with: '18201-020'
      click_button 'commit'
    end
    expect(page).to have_content('A empresa foi criado com sucesso')

  end
  it 'insirendo uma empresa que já existe' do
    visit '/modelos/new'
    within("#form-empresa") do
      select('Country-1', from: 'empresa_country_id')
      #fill_in "empresa_nome", with: SecureRandom.alphanumeric
      fill_in "empresa_nome", with: 'Empresa-1'
      fill_in "empresa_cnpj", with: '9999999999'
      fill_in "empresa_cep", with: '18201-020'
      click_button 'commit'
    end
    expect(page).to have_content('Nome has already been taken')
  end



end


