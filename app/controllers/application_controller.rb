class ApplicationController < ActionController::Base
 
  protect_from_forgery with: :exception
  #before_filter :authenticate_user!

 
  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = I18n.t(:not_authorize)
    redirect_to root_path
  end


  before_action :set_locale

  def set_locale

    if !params[:locale].nil?
      I18n.locale = params[:locale]
    end

  end

  private

  
  protected
    def self.permission
      self.name.gsub('Controller','').singularize.split('::').last.constantize.name rescue nil
    end

    def current_ability
      @current_ability ||= Ability.new(current_user)
    end

    def load_permissions
      @current_permissions = current_user.roles.each do |role|
        role.permissions.collect{|i| [i.subject_class, i.action]}
      end
    end

    def set_user
      @user = User.find_by(id: ActionController::Parameters.new(id: params[:id]).permit(:id)[:id])
    end

    def user_params
      params.require(:user).permit(:full_name, :email, :password, :role, :avatar_image)
    end

    def params_id
      ActionController::Parameters.new(id: params[:id]).permit(:id)[:id]
    end


end
