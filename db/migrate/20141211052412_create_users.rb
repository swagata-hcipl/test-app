class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name
    	t.string :email
    	t.string :password
    	t.string :salt
    	t.text :encrypted_password
    	t.string :employeeid
        t.timestamps
    end
  end
end
