class EmployeeController < ApplicationController
  def register
 	  @employee = Employee.new
  end

  def create
	  @employee = Employee.new(employee_params)
	  if @employee.save
		  flash[:notice] = "New employee created"
		  flash[:color]= "valid"
		  redirect_to root_path
	  else
		  render "register"
    end
  end

  def employee_params
      params.require(:employee).permit(:name, :email, :employeeid)
  end

  def profile
  	@employees = Employee.all
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update_attributes(employee_params)
      redirect_to :action => 'profile', :id => @employee
    else
      render :action => 'edit'
    end
  end

  def delete
  end
end
