class VendorController < ApplicationController
  def new
 	  @vendor = Vendor.new
  end

  def create
	  @vendor = Vendor.new(vendor_params)
	  if @vendor.save
		  flash[:notice] = "New vendor created"
		  flash[:color]= "valid"
		  redirect_to root_path
	  else
		  render "new"
    end
  end

  def vendor_params
      params.require(:vendor).permit(:name, :manager, :address, :phone_no, :phone_no_other)
  end


  def show
    @vendors = Vendor.all
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])
    if @vendor.update_attributes(vendor_params)
      redirect_to :action => 'show', :id => @vendor
    else
      render :action => 'edit'
    end
  end
end
