require Time

class ShoppingCart
	def initialize(contents) # constructor accepts an array of items
		contents.each do |shopItem| # how do I say if shopItem extends Item?
			add(shopItem)	
		end
	end

	def add(shopItem)
		if(shopItem.class == "Item" ||
			shopItem.class == "Fruit" || 
			shopItem.class == "Houseware")
			@contents << shopItem
		end
	end

	def totalSales()
		sales = 0 # do I need to initialize these?
		inCart = 0
		@contents.each do |lineItem|
			sales = sales + lineItem.discount()
			inCart = inCart + 1
		end
		if(inCart > 5)
			return sales - (.10 * sales)
		else
			return sales
		end
	end
end

class Item
	attr_accessor :name
	attr_accessor :msrp
	@@total = 0

	def initialize(name, price)
		@name = name
		@msrp = price
		@@total = @@total + 1
	end

	def totalItemsInStore()
		return @@total
	end
end

class Fruit < Item
	def discount()
		if (Time.now.saturday? || Time.now.sunday?)
			return msrp - (.10 * msrp)
		end
	end
end

class Houseware < Item
	def discount()
		if @msrp > 100)
			return @msrp - (0.05 * @msrp)
		end
	end
end
