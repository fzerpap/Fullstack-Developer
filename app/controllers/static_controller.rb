class StaticController < ApplicationController
   
  def index

    @user |= User.new

  end

  # GET
  def sign_up
    @user = User.new

  end

  # POST
  def create
    @user = User.new(user_params.merge(role: User.roles[:no_admin]))
    respond_to do |format|
      if @user.save
        format.html { redirect_to  root_url, notice: I18n.t(:sign_up_user_created_ok) }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :sign_up, notice: I18n.t(:user_not_created) }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
   end
  


end
