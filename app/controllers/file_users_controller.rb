class FileUsersController < ApplicationController
  before_action :set_file_user, only: %i[ show edit update destroy ]

  # GET /file_users or /file_users.json
  def index
    @users = $users
  end

  # GET /file_users/1 or /file_users/1.json
  def show
  end

  # GET /file_users/new
  def new
    @file_user = FileUser.new
  end

  # GET /file_users/1/edit
  def edit
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

  # PATCH/PUT /file_users/1 or /file_users/1.json
  def update
    respond_to do |format|
      if @file_user.update(file_user_params)
        format.html { redirect_to @file_user, notice: "File user was successfully updated." }
        format.json { render :show, status: :ok, location: @file_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @file_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /file_users/1 or /file_users/1.json
  def destroy
    @file_user.destroy
    respond_to do |format|
      format.html { redirect_to file_users_url, notice: "File user was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_file_user
      @file_user = FileUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def file_user_params
      params.require(:file_user).permit(:name)
    end
end
