class Users::SessionsController < Devise::SessionsController
  
  # GET /resource/sign_in
  def new
    super
  end
    
  # POST /resource/sign_in
  def create
    user = User.find_by_email(params[:user][:email])
    if !user.nil?
      if !user.valid_password?(params[:user][:password])
        respond_to do |format|
          format.html { redirect_to new_user_session_path, alert: 'A Senha inserida é inválida' }
        end
      else
        self.resource = warden.authenticate!(auth_options)
        sign_in(resource_name, resource)
        yield resource if block_given?
        if user.role == 'admin'
          redirect_to paneis_path, notice: 'Autentição foi com sucesso' 
        else  
          redirect_to profile_path, notice: 'Autenticação foi com sucesso' 
        end  
      end
    else
      respond_to do |format|
        format.html { redirect_to new_user_session_path,alert: 'O email inserido é inválido ' }
      end
    end
  end
end
    