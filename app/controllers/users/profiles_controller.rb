class Users::ProfilesController < ApplicationController
  before_action :authenticate_user!

  def profile
    
  end

  def edit
  end

  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to profile_path, notice: 'Seu perfil foi actualizado com sucesso.' }
        format.json { render :profile, status: :ok, location: current_user }
      else
        format.html { render :edit }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if user_signed_in?
      if @user.destroy
        redirect_to destroy_user_session_path
      end
    end
    #authorize! :update, User
  end

  private
    def user_params
      params.require(:user).permit(:full_name, :email, :avatar_image)
    end

end