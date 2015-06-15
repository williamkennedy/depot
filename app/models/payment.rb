class Payment < ActiveRecord::Base
	belongs_to :order

	self.inheritance_column = nil
end
