class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :location
      t.string :name
      t.text :description
      t.string :types
      t.references :owner
      t.string :status
      t.string :model_no
      t.string :serial_no
      t.string :mac_address
      t.date :purchase_date
      t.string :purchase_order
      t.references :vendor
      t.decimal :cost, :precision => 8, :scale => 2
      t.string :amc
      t.decimal :amc_amount, :precision => 8, :scale => 2
      t.date :expiry_date
      t.date :status_date
      t.string :warranty_type
      t.attachment :image_url
      t.string :IS_type
      t.string :integrity
      t.string :confidentiality
      t.text :note
      #t.integer :user_id
      t.references :employee
      t.string :activity

      t.timestamps
    end
  end
end
