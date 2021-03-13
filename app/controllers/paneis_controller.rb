class PaneisController < ApplicationController
  
  before_action :set_data

  def index
    authorize! :index, User
  end

  # GET - refresh the dashboard automatic  
  def refresh
    render :index
    authorize! :index, User
  end

  private

  def set_data
    @total_users = User.count
    @users_role = User.xrole

    @series = [ {name: "Usuários", data: User.group_by_month(:created_at).count } ]

  end
 
end
