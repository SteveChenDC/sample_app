class UsersController < ApplicationController
  def new
    @user = User.new
    @test = User.new
  end

  def show
    @user = User.find_by(params[:id])
    @test = User.new
  end

  def create
    @user = User.new(user_params)
    @test = User.new
    if @user.save
      log_in @user
      flash[:success] = "welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
