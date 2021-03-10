class Users::RegistrationsController < Devise::RegistrationsController
  before_action :set_user, only: [:show, :update_user, :edit_user, :delete_user]

  @@password = ""

  def new_user
    unless user_signed_in?
      redirect_to root_url and return
    end
    @user = User.new
    #authorize! :new, User
  end

  def create_user
    if signed_in?
      @user = User.new(user_params)
      @@password = user_params[:password]
      respond_to do |format|
        if @user.save
          #PasswordMailer.send_password(@user, @@password).deliver
          format.html { redirect_to  user_show_path(@user), notice: I18n.t(:user_created_ok) }
          format.json { render :show, status: :created, location: @user }
        else
          #set_roles
          format.html { render :new_user }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_url and return
    end
    #authorize! :create, User
  end

  def show
    @pass = @@password
    @@password = ""
    #authorize! :show, User
  end

  def index
    unless user_signed_in?
      redirect_to root_url and return
    end
    @users = User.all

    #authorize! :show, User
  end

  def edit_user
    unless user_signed_in?
      redirect_to root_url and return
    end

    #authorize! :update, User
  end

  def update_user
    if user_signed_in?
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to user_show_path(@user), notice: I18n.t(:user_updated_ok) }
          format.json { render :show, status: :ok, location: @user }
        else
          set_roles
          format.html { render :edit_user }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
    #authorize! :update, User
  end

  def delete_user
    puts(params[:role_type])
    if user_signed_in?
      if @user.destroy
        redirect_to users_index_path, alert: I18n.t(:user_destroy_ok) and return
      end
    end
    #authorize! :update, User
  end


end