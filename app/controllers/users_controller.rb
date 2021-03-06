class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to :root
    else
      # byebug
      if @user.errors.size > 0
        puts 'THERE WERE ERRORS!'
      end
    
      render :new
    end
  end


  private

  def user_params
    params[:user][:email] = params[:user][:email].downcase
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
