class ShoppingCart
	def initialize()
		@contents = []
	end

	def add(shopItem)
		if(shopItem.class <= Item)
			@contents << shopItem
			puts "Bought #{shopItem.name}! Today's price: $#{shopItem.discount()}."
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
			return sales - (0.10 * sales)
		else
			return sales
		end
	end
end

class Item
	attr_reader :name
	attr_reader :msrp
	@@total = 0

	def initialize(name, price)
		@name = name
		@msrp = price
		@@total = @@total + 1
	end

	def discount() 
		return @msrp
	end

	def totalItemsInStore()
		return @@total
	end


end

class Fruit < Item
	def discount()
		if (Time.now.saturday? || Time.now.sunday?)
			return msrp - (0.10 * msrp)
		else
			return msrp
		end
	end
end

class Houseware < Item
	def discount()
		if(@msrp > 100)
			return @msrp - (0.05 * @msrp)
		end
	end
end

myCart = ShoppingCart.new
Bananas = Fruit.new("Bananas", 10)
OrangeJuice = Item.new("Orange Juice", 10)
Rice = Item.new("Rice", 1)
VacuumCleaner = Houseware.new("Vacuum Cleaner", 150)
Anchovies = Item.new("Anchovies", 2)
myCart.add(Bananas)
myCart.add(OrangeJuice)
myCart.add(Rice)
myCart.add(Rice)
myCart.add(Rice)
myCart.add(Rice)
puts "Your total comes to $#{myCart.totalSales()} with any discounts. Thank you for shopping at IronStore!"