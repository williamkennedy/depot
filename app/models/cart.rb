class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	def add_product(product_id, product_price)
		current_item = line_items.find_by(product_id: product_id, :price => product_price)
		if current_item
			current_item.quantity += 1
			current_item.price 
		else
			current_item = line_items.build(product_id: product_id)
		end
		current_item
	end

	def total_price
		line_items.to_a.sum { |item| item.total_price}
	end
end
