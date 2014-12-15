class OwnerController < ApplicationController
  def new
 	  @owner = Owner.new
  end

  def create
	  @owner = Owner.new(owner_params)
	  if @owner.save
		  flash[:notice] = "New owner created"
		  flash[:color]= "valid"
		  redirect_to root_path
	  else
		  render "new"
    end
  end

  def owner_params
      params.require(:owner).permit(:client, :process, :name)
  end

  def show
    @owners = Owner.all
  end

  def view
    @owner = Owner.find(params[:id])
  end

  def edit
    @owner = Owner.find(params[:id])
  end

  def update
    @owner = Owner.find(params[:id])
    if @owner.update_attributes(owner_params)
      redirect_to :action => 'show'
    else
      render :action => 'edit'
    end
  end
end
