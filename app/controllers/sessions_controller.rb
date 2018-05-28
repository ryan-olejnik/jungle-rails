class SessionsController < ApplicationController

  def new #login form
    @user = User.new
  end


  def create 
    # byebug
    @user = SessionsController.authenticate_with_credentials(params[:email], params[:password])
    if @user
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = @user.id
      # puts "#{user[:first_name]} #{user[:last_name]} has LOGGED ON!!"
      # byebug
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      render :new
    end
  end

  def destroy #user logs out
    session[:user_id] = nil
    redirect_to '/'
  end

  def self.authenticate_with_credentials(email, password)
    #remove leading/trailing spaces from email (there should not be internal spaces), and downcase:
    email = email.tr(' ', '').downcase

    user = User.find_by_email(email)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

end
