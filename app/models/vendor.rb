class Vendor < ActiveRecord::Base
	has_many :assets
	validates_presence_of :name
	validates_presence_of :manager
	validates_presence_of :address
	validates :phone_no, numericality: { only_integer: true }, length: { is:10 }
	validates :phone_no_other, numericality: { only_integer: true }, length: { is:10 }
end
