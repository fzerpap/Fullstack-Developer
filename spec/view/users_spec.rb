require 'rails_helper'
require 'view/support/authenticate'

describe 'Admin access to users page ' do
  include_context 'Authenticate'
  let(:admin) { create(:admin)}
  let(:users) { create_list(:user,5)}
  let(:link_edit_user) { 'edit-user-'+users[1].id.to_s }
  let(:link_destroy_user) { 'destroy-user-'+users[1].id.to_s }

  before do
    sign_in(admin)
  end

  
  it "get users list" do
    click_link 'menu-users'
    expect(page).to have_content('Lista de Usuários')
  end
   
  it "Create new user" do
    click_link 'menu-users'
    click_link 'link-new-user'
    expect(page).to have_content('Novo Usuário')

    within("#form-user") do
      select('Admin', from: 'role')
      fill_in "user_full_name", with: 'User-Umanni'
      fill_in "user_email", with: 'uumanni@gmail.com'
      fill_in "email_confirmation", with: 'uumanni@gmail.com'
      fill_in "user_password", with: '12345678'
      fill_in "user_password_confirmation", with: '12345678'
    end
    click_button 'commit'

    expect(page).to have_content('O usuário foi criado com sucesso')  
  end

  it "Edit user" do
    
    click_link 'menu-users'
    expect(page).to have_content('Lista de Usuários')
    click_link  link_edit_user
    expect(page).to have_content('Editando Usuário')

    within("#form-user") do
      select('Admin', from: 'role')
      fill_in "user_full_name", with: 'User-Umanni-Edited'
      fill_in "user_email", with: 'uumanni@gmail.com'
      fill_in "email_confirmation", with: 'uumanni@gmail.com'
      fill_in "user_password", with: '12345678'
      fill_in "user_password_confirmation", with: '12345678'
    end
    click_button 'commit'

    expect(page).to have_content('O usuário foi atualizado com sucesso')  
  end

  it "Destroy user" do
    
    click_link 'menu-users'
    expect(page).to have_content('Lista de Usuários')
    click_link  link_destroy_user
    expect(page).to have_content('Está seguro de excluir o usuario ?')

  
  end

end


