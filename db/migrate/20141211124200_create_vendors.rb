class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :manager
      t.string :address
      t.string :phone_no
      t.string :phone_no_other

      t.timestamps
    end
  end
end
