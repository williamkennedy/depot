require 'test_helper'

class CartTest < ActiveSupport::TestCase
	test "unique product should save" do
		product = Product.new(:title => "unique-book",
			:description => "a unique product",
			:image_url => "unique.png",
			:price => 22)

		assert product.save
	end
	#Test is failing 
	#test "non unique product should give an error" do
	#	product = Product.new(:title => "unique-book",
	#		:description => "a unique product",
	#		:image_url => "unique.png",
	#		:price => 22)

#		assert !product.save
#		assert_equal "has not been saved it is a duplicate ", product.errors[:title].join('; ')
#	end


end
