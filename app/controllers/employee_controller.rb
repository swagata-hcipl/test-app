class EmployeeController < ApplicationController
  def register
 	  @employee = Employee.new
  end

  def create
	  @employee = Employee.new(employee_params)
	  if @employee.save
		  flash[:notice] = "New employee created"
		  flash[:color]= "valid"
		  redirect_to show_employee_path
	  else
		  render "register"
    end
  end

  def employee_params
      params.require(:employee).permit(:name, :email, :employeeid)
  end

  def show
    @employees = Employee.all
  end

  def profile
    @employee = Employee.find(params[:id])
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update_attributes(employee_params)
      redirect_to :action => 'show', :id => @employee
    else
      render :action => 'edit'
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    flash[:notice] = "Successfully deleted employee."
    redirect_to show_employee_path
  end
end
