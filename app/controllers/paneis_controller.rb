class PaneisController < ApplicationController
  
 
  def index
    # disponibilidad de dinheiro
    @total_users = User.count
    @users_role = User.xrole
 
    
    
  end

  d1=('01/'+Date.today.month.to_s+'/'+Date.today.year.to_s).to_date

  def show
  end

  
  def new
    @banco = Banco.new
  end

  
  def edit
  end

  
  def create
    @banco = Banco.new(banco_params.merge(empresa_id: current_user.empresa_id))

    respond_to do |format|
      if @banco.save
        format.html { redirect_to bancos_url, notice: I18n.t(:notice_fornecedor_create) }
        format.json { render :show, status: :created, location: @banco }
      else
        format.html { render :new }
        format.json { render json: @banco.errors, status: :unprocessable_entity }
      end
    end
  end

  
 
end
