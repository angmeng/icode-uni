class UsersController < ApplicationController
  before_filter :are_you_admin?
  before_action :set_user, only: [:show, :edit_user, :update_user, :destroy, :entry_user]
  ## before_action :checkboxes##, only: [:show]
  
  # GET /users
  # GET /users.json
  

  # def index
  #   respond_to do |format|
  #     format.html
  #     format.json { render json: UsersDatatable.new(view_context) }
  #   end
  # end

  def index
    @users = User.all
  end


  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new_user
    @user = User.new
  end

  # GET /users/1/edit
  def edit_user
  end

  def entry_user
  end


  # def generator_user

  #    respond_to do |format|
  #     if UserRegister.generate_role(@user, params[:inventory_management_system])
  #       format.html { redirect_to users_path, notice: 'Role was successfully created.' }
  #       format.json { render action: 'show', status: :created, location: @role }
  #     else
  #       format.html { render action: 'new_role' }
  #       format.json { render json: @role.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def update
  #   @user = User.find(params[:id])
  #   @role = @user.roles.find(params[:id])
  #   respond_to do |format|
  #     if UserRegister.generate_role(@user, params[:inventory_management_system])
  #       format.html { redirect_to users_path, notice: 'Role was successfully created.' }
  #       format.json { render action: 'show', status: :created, location: @role }
  #     else
  #       format.html { render action: 'new_role' }
  #       format.json { render json: @role.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def old_generator_user
  #   if params[:inventory_management_system].present?
  #     @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation], :admin => params[:admin])
  #     if @user.save
  #       UserRegister.generate_role(@user, params[:inventory_management_system])
  #       redirect_to user_path(@user), :notice => "User has created successfully."
  #     else
  #       flash[:alert] = @user.errors.full_messages.join(", ")
  #       render "entry_user"
  #     end
  #   else
  #     flash[:alert] = "Please tick the checkboxes on your inventory management system."
  #     render "entry_user"
  #   end
  # end

  # POST /users
  # POST /users.json
  def create_user

    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new_user' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit_user' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :admin, :status)
    end

    def checkboxes
      @checkboxes = @user.roles.map(&:inventory_management_system_id)
    end
end
