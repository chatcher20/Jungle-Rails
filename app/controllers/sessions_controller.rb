# Create a sessions controller. This is where we create (aka login) and destroy (aka logout) sessions.

# app/controllers/sessions_controller.rb



class SessionsController < ApplicationController

  def new
  end

  def create

    @user = User.find_by_email(params[:email].downcase.strip)

    if (!@user)
      puts "User not found."
      redirect_to '/login', notice: "Invalid email or password"

    if @user = @user.authenticate_with_credentials(params[:email].downcase.strip, params[:password])
      # success logic, log them in
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = @user.id
      redirect_to '/'
    else
      # If user's login doesn't work, send them back to the login form.
      redirect_to '/login', notice: "Invalid email or password"
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login', notice: 'Successfully logged out'
  end

end

