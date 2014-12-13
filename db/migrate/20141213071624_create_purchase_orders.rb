class CreatePurchaseOrders < ActiveRecord::Migration
  def change
    create_table :purchase_orders do |t|
    	t.string :name
    	t.attachment :scan
    	t.references :asset_id

      t.timestamps
    end
  end
end
