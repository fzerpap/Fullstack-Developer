RSpec.shared_context 'Authenticate' do
  
  def sign_in(user)
    visit '/users/sign_in'
    within("#form-sign-in") do
      fill_in "login-email", with: user.email
      fill_in "login-password", with: user.password
    end
    click_button 'commit'
  end
end
