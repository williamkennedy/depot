class Order < ActiveRecord::Base
	has_many :line_items, dependent: :destroy
	has_many :payments
	validates :name, :address, :email, presence: true

	def assign_pay_type
		self.pay_type = Payment.type
	end

	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
	end

end
