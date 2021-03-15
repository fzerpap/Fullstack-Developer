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
        $users = @file_user.import_users[:users]
        if $users != nil
            format.html { redirect_to file_users_path, notice: "Usuarios carregados com sucesso" }
        else
          format.html { redirect_to new_file_user_path, notice: "Arquivo inválido ou já foi atualizado no sistema." }
        end
        @file_user.destroy
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @file_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET 
  def import
    if User.import($users)
      redirect_to root_path, notice: "Usuarios criados com sucesso" 
    else
      redirect_to root_path, notice: "Os Usuarios nao foram criados. Por favor, repeta o processo" 
    end  
  end

  private

    # Only allow a list of trusted parameters through.
    def file_user_params
      params.require(:file_user).permit(:name)
    end
end
