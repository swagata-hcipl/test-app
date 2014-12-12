class AssetController < ApplicationController
before_filter :authenticate_user
#before_filter :generate_uuid
  def new
 	  @asset = Asset.new
  end

  def create
	  @asset = Asset.new(asset_params)
    #@checkvar = @asset.amc == "N" ? true : false
	  #@user = User.find(params[:id])
	  if @asset.save
		  flash[:notice] = "New asset created"
		  flash[:color]= "valid"
		  redirect_to root_path
	  else
		  render "new"
    end
  end

  def asset_params
      params.require(:asset).permit(:location, :name, :description, :types, :owner, :status, :model_no, :serial_no, :mac_address,
       :purchase_date, :purchase_order, :vendor, :cost, :amc, :amc_amount, :expiry_date, :status_date, :warranty_type, :image_url,
       :IS_type, :integrity, :confidentiality, :note, :user_id, :assigned_to, :activity)
  end

  def uploadFile
    post = DataFile.save(params[:upload])
    render :text => "File has been uploaded successfully"
  end

  def view
    @assets = Asset.all
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

end
