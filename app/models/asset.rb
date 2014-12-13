class Asset < ActiveRecord::Base
	belongs_to :user
	has_one :owner
	has_one :vendor
	has_one :purchase_order

	has_attached_file :image_url, :styles => { :thumb => "100x100>" },
                  :url  => "/assets/products/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

	validates_attachment_size :image_url, :less_than => 5.megabytes
	validates_attachment_content_type :image_url, :content_type => ['image/jpeg', 'image/png']

	validates :model_no, :presence => true
	validates :serial_no, :presence => true
	validates_associated :user
	#number_to_currency(cost, :unit => "Rs.")
	YN = ["Y","N"]
	TYPE = ["Desktop", "Laptop", "monitor", "mouse", "keyboard", "headset", "mobile", "tablet", "printer", "router", "firewall", "switch", "software"]
	STATUS = ["active", "spare", "faulty", "returned", "servicing", "inactive"]
	WARRANTY = ["1 year", "2 years", "3 years", "4 years", "5 years", "perpetual"]
	HML = ["H","M","L"]

	#paginates_per 10
end
