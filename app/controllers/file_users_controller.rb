class FileUsersController < ApplicationController

  load_and_authorize_resource

  # GET /file_users or /file_users.json
  def index
    @users = $users
  end


  # GET /file_users/new
  def new
    @file_user = FileUser.new
  end

  # POST /file_users or /file_users.json
  def create
    @file_user = FileUser.new(file_user_params)

    respond_to do |format|
      if @file_user.save
        $users = @file_user.import_users
        if $users != []
            format.html { redirect_to file_users_path, notice: "Usuarios carregados com sucesso" }
            format.json { render :show, status: :created, location: @file_user }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @file_user.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @file_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def import_users
  end
  private

    # Only allow a list of trusted parameters through.
    def file_user_params
      params.require(:file_user).permit(:name)
    end
end
