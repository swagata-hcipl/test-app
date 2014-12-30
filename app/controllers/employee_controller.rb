class EmployeeController < ApplicationController
  def register
 	  @employee = Employee.new
    @owner = Owner.new
  end

  def create
	  @employee = Employee.new(employee_params)
    if @employee.is_owner == true
      @owner = Owner.new(owner_params)
	    if @employee.save&&@owner.save
		    flash[:notice] = "New employee & owner created"
		    flash[:color]= "valid"
		    redirect_to :action => 'show'
	    else
		    render "register"
      end
    else
      if @employee.save
        flash[:notice] = "New employee created"
        flash[:color] = "valid"
        redirect_to :action => 'show'
      else
        render "register"
      end
    end
  end

  def employee_params
      params.require(:employee).permit(:name, :email, :employeeid, :is_owner)
  end
  def owner_params
      params.require(:employee).permit(:client, :process, :name)
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
      redirect_to :action => 'profile', :id => @employee
    else
      render :action => 'edit'
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    flash[:notice] = "Successfully deleted employee."
    redirect_to :action => 'show'
  end
end
