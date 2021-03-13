class PaneisController < ApplicationController
  
  #load_and_authorize_resource

  def index
    # disponibilidad de dinheiro
    @total_users = User.count
    @users_role = User.xrole
    @series = User.xdia(Date.today.year,Date.today.month)
    @options_chart = {
      title: 'Crecimento de Usuários',
      subtitle: 'Agrupado x Día',
      xtitle: 'Dia',
      ytitle: 'Usuários',
      stacked: true
    } 
    authorize! :index, User
   
  end

  
 
end
