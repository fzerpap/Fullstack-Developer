class PasswordMailer < ActionMailer::Base
  default from: "soport@cabify_store.com"

  def send_password(user, password)
    @user = user
    @password = password
    @host = 'http://cabiby-store.es.to'
    mail(to: user.email, subject: I18n.t(:email_subject))
  end
end