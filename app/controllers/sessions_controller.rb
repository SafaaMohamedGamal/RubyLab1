class SessionsController < ApplicationController
  	EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  
  def new
  	@user = User.new
  end

  def create
  	username_or_email = params[:user][:username]
  	  if  EMAIL_REGEX.match(username_or_email)    
	    @user = User.find_by_email(username_or_email)
	  else
	    @user = User.find_by_username(username_or_email)
	  end

   if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
  else
  		render 'new'
   end
  end

  def destroy 
	  session[:user_id] = nil  
	  redirect_to root_path
  end

end
