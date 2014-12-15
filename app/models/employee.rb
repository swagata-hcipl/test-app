class Employee < ActiveRecord::Base
	has_many :users
	has_many :assets
end
