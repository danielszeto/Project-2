class UsersController < ApplicationController
  before_action :require_login, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_self, only: [:edit, :update]

  def index
    @users = User.order(:first_name)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Profile updated.'
    else
      render :edit
    end
  end

  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def require_self
    head :forbidden unless @user.id == current_user.id
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :age, :location, :bio, :file)
  end
end
