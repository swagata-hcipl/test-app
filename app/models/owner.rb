class Owner < ActiveRecord::Base
	has_many :assets
	#belong_to :employee
	validates_presence_of :client
	validates_presence_of :process
	validates_presence_of :name
end
