class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :client
      t.string :process
      t.string :name
      t.references :asset

      t.timestamps
    end
  end
end
