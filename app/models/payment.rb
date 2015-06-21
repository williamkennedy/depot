class Payment < ActiveRecord::Base
	belongs_to :order
	validates :payments, presence: true

	self.inheritance_column = nil
end
