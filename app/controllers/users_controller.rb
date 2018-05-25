class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    puts "params = #{params}"
    puts "params[:user] = #{params[:user]}"
    new_user = {
      first_name: params[:user][:first_name],
      last_name: params[:user][:last_name],
      email: params[:user][:email],
      password: params[:user][:password],


    }
    @user = User.create!(new_user)
    redirect_to :root
  end

end

