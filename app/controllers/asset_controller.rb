class AssetController < ApplicationController
before_filter :authenticate_user
#before_filter :generate_uuid
  def new
 	  @asset = Asset.new
    @purchase_order = PurchaseOrder.new
  end

  def create
	  @asset = Asset.new(asset_params)
    @purchase_order = PurchaseOrder.new(purchase_params)
	  if @asset.save && @purchase_order.save
		  flash[:notice] = "New asset created"
		  flash[:color]= "valid"
		  redirect_to root_path
	  else
		  render "new"
    end
  end

  def asset_params
    params.require(:asset).permit(:location, :name, :description, :types, :owner_id, :status, :model_no, :serial_no, :mac_address,
    :purchase_date, :scan, :vendor_id, :cost, :amc, :amc_amount, :expiry_date, :status_date, :warranty_type, :image_url,
    :IS_type, :integrity, :confidentiality, :note, :employee_id, :assigned_to, :is_active, :purchase_order_id)
  end

  def purchase_params
    params.require(:asset).permit(:name, :scan)
  end

  def uploadFile
    post = DataFile.save(params[:upload])
    render :text => "File has been uploaded successfully"
  end

  def view
    @asset = Asset.find(params[:id])
    @purchase_order = PurchaseOrder.all
  end

  def edit
    @asset = Asset.find(params[:id])
  end

  def update
    @asset = Asset.find(params[:id])
    if @asset.update_attributes(asset_params)
      redirect_to :action => 'view', :id => @asset
    else
      render :action => 'edit'
    end
  end

 def deactivate
   @asset = Asset.find(params[:id])
   if @asset.update_attributes(:is_active => false)
    redirect_to :controller => 'session', :action => 'inactive'
  else
    redirect_to :controller => 'session', :action => 'home'
  end
 end

  def activate
   @asset = Asset.find(params[:id])
   if @asset.update_attributes(:is_active => true)
    redirect_to :controller => 'session', :action => 'active'
  else
    redirect_to :controller => 'session', :action => 'home'
  end
 end

 def search
  @assets = Asset.filter(params.slice(:status, :owner_id, :types, :employee_id))
 end

  private
  def sort_column
    Asset.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
