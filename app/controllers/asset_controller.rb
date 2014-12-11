class AssetController < ApplicationController
before_filter :authenticate_user
#before_filter :generate_uuid
  def new
 	@asset = Asset.new
  end

  def create
	@asset = Asset.new(asset_params)
	@user = User.find(params[:id])
	if @asset.save
		flash[:notice] = "New asset created"
		flash[:color]= "valid"
		redirect_to root_path
	else
		render "new"
    end
  end



  def view
  end

  def edit
  end
end
