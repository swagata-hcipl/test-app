class Asset < ActiveRecord::Base
	belongs_to :employee
	belongs_to :owner
	has_one :vendor
	has_one :purchase_order

	#attr_accessor :scan_file_name, :scan_content_type

	validates_presence_of :model_no
	validates :serial_no, :presence => true
	has_attached_file :image_url, :styles => { :thumb => "100x100>" },
                  :url  => "/assets/products/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

	validates_attachment_size :image_url, :less_than => 5.megabytes
	validates_attachment_content_type :image_url, :content_type => ['image/jpeg', 'image/png']

	has_attached_file :scan, :styles => { :small => "160x160>" },
	                  :url  => "/assets/products/:id/:style/:basename.:extension",
                  	  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"
	validates_attachment_content_type :scan, :content_type => ['image/jpeg', 'image/png']


	validates_associated :employee
	#number_to_currency(cost, :unit => "Rs.")
	YN = ["Y","N"]
	TYPE = ["Desktop", "Laptop", "monitor", "mouse", "keyboard", "headset", "mobile", "tablet", "printer", "router", "firewall", "switch", "software"]
	STATUS = ["active", "spare", "faulty", "returned", "servicing", "inactive"]
	WARRANTY = ["1 year", "2 years", "3 years", "4 years", "5 years", "perpetual"]
	HML = ["H","M","L"]

	scope :status, -> (status) { where status: status }
	scope :owner_id, -> (owner_id) { where owner_id: owner_id }
	scope :employee_id, -> (employee_id) { where employee_id: employee_id }
	scope :types, -> (types) { where types: types }



	def self.search(search)
	  if search
	    where('name LIKE ?', "%#{search}%")
	  else
	    all
	  end
	end


	def self.to_csv(options = {})
	  CSV.generate(options) do |csv|
	    csv << column_names
	    all.each do |asset|
	      csv << asset.attributes.values_at(*column_names)
	    end
	  end
	end

	#paginates_per 10
end
