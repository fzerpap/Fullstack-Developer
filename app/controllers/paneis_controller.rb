class PaneisController < ApplicationController
  
  #load_and_authorize_resource

  def index
    # disponibilidad de dinheiro
    @total_users = User.count
    @users_role = User.xrole
    authorize! :index, User
   
  end

  
 
end
