class Asset < ActiveRecord::Base
	belongs_to :user
	#attr_accessible :user_id

	validates :model_no, :presence => true
	validates :serial_no, :presence => true
	validates_associated :user
	#number_to_currency(cost, :unit => "Rs.")
	AMC = ["Y","N"]
	TYPE = ["Desktop", "Laptop", "monitor", "mouse", "keyboard", "headset", "mobile", "tablet", "printer", "router", "firewall", "switch", "software"]
	STATUS = ["active", "spare", "faulty", "returned", "servicing", "inactive"]
	WARRANTY = ["1 year", "2 years", "3 years", "4 years", "5 years", "perpetual"]
	HML = ["H","M","L"]


	#paginates_per 10
end
