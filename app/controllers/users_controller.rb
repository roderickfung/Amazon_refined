class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    respond_to do |format|
      if @user.save
        format.html{redirect_to @user, notice: 'User successfully created'}
        format.json{render :show, status: :created, location: @user}
      else
        format.html{render :new}
        format.json{render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def set_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
