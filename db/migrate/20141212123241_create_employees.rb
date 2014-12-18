class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
    	t.string :name
    	t.string :email
    	t.string :employeeid
      t.string :client
      t.string :process
      t.boolean :is_owner
    	t.references :asset
      t.timestamps
    end
  end
end
