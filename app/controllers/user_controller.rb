class UserController < ApplicationController
  	def new
		@user = User.new
		@employee = Employee.new
	end

	def create
		@user = User.new(user_params)
		@employee = Employee.new(employee_params)
		if @user.save&&@employee.save
			flash[:notice] = "You signed up successfully"
			flash[:color]= "valid"
			redirect_to :controller => 'session', :action => 'login'
		else
			flash[:notice] = "Form is invalid"
			flash[:color]= "invalid"
			render "new"
		end
		
	
	end

	def user_params
    	params.require(:user).permit(:name, :email, :password, :salt, :employeeid)
  	end

  	def employee_params
  		params.require(:user).permit(:name, :email, :employeeid)
  	end
  	
  	before_filter :save_login_state, :only => [:new, :create]

end 

