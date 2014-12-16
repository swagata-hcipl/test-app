class SessionController < ApplicationController
  before_filter :authenticate_user, :only => [:home, :active, :inactive, :create_asset, :create_vendor, :create_owner]
  before_filter :save_login_state, :only => [:login, :login_attempt]
  helper_method :sort_column, :sort_direction  
  
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
    @assets = Asset.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
    #@asset_paginate = Asset.paginate(:page => params[:page], :per_page => 30)
  end

  def active
    @assets =Asset.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
  end

  def inactive
    @assets = Asset.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
  end


  def logout
		session[:user_id] = nil
		redirect_to :action => 'login'
  end

  private
  def sort_column
    Asset.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
