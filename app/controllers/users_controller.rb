class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(create_params)
    if @user.save
      sign_in(@user)
      flash[:success] = "Welcome, #{@user.name}!"
      redirect_to @user
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
       if @user.update(update_params)
      redirect_to user_url(@user), notice: "用户信息已经成功更新." 
      else
      render :edit, status: :unprocessable_entity 
      end
     end

  # DELETE /users/1 or /users/1.json
  def destroy
       @user.destroy
      redirect_to users_url, notice: "用户已经成功删除."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def update_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def create_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
