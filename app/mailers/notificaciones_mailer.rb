class NotificacionesMailer < ActionMailer::Base
  default from: "soport@cabifystore.com"

  def notify_stores(user)
    @user = user
    @host = 'http://cabify.com'
    mail(to: user.email, subject: "Notificación sobre su tienda en #{user.store.name}")
  end


end
