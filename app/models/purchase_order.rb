class PurchaseOrder < ActiveRecord::Base
	belongs_to :asset
	has_attached_file :scan, :styles => { :small => "160x160>" }
	validates_attachment_content_type :scan, :content_type => ['image/jpeg', 'image/png']

end
