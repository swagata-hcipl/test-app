class SessionController < ApplicationController
  before_filter :authenticate_user, :only => [:home, :active, :inactive, :create_asset, :create_vendor, :create_owner]
  before_filter :save_login_state, :only => [:login, :login_attempt]  
  
  def login
  	 #Login Form
  end

  def login_attempt
  	authorized_user = User.authenticate(params[:employeeid_or_email],params[:login_password])
	if authorized_user
		session[:user_id] = authorized_user.id
		flash[:notice] = "You logged in as #{authorized_user.name}"
		redirect_to(:action => "home")
	else
		flash[:notice] = "Invalid Employee ID or Password"
		flash[:color]= "invalid"
		render "login"	
	end 
  end

  def home
    @assets = Asset.all
  end

  def active
  end

  def inactive
  end


  def logout
		session[:user_id] = nil
		redirect_to :action => 'login'
  end

end
