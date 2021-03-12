require 'rails_helper'


describe 'Admin access to users page ' do
  let(:admin) { create(:admin)}
  let(:users) { create_create(:users,7)}

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in admin
  end

  it 'entry to the home page' do
    visit '/index'
    expect(page).to have_content(admin.full_name)
  end

  it 'entry to the users page' do
    visit '/users/index'
    expect(page).to have_content('Lista de Usuários')
  end

  it 'entry to page to create new user' do
    visit '/users/new'
    expect(page).to have_content('Nome Completo')
  end

  it 'adding new user' do
    visit '/users/new'
    within("#form-user") do
      select('Admin', from: 'role')
      fill_in "user_full_name", with: 'User-Umanni'
      fill_in "user_email", with: 'uumanni@gmail.com'
      fill_in "email_confirmation", with: 'uumanni@gmail.com'
      fill_in "user_password", with: '12345678'
      fill_in "user_password_confirmation", with: '12345678'
      click_button 'commit'
    end
    expect(page).to have_content('O usuário foi criado com sucesso')

  end
  it 'adding user jet exist' do
    visit '/users/new'
    within("#form-user") do
      select('Admin', from: 'role')
      fill_in "user_full_name", with: 'Full-Name-User-1'
      fill_in "user_email", with: 'uumannix@gmail.com'
      fill_in "email_confirmation", with: 'uumannix@gmail.com'
      fill_in "user_password", with: '12345678'
      fill_in "user_password_confirmation", with: '12345678'
      click_button 'commit'
    end
    expect(page).to have_content('Nome has already been taken')
  end



end


