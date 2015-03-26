class ShoppingCart
	def initialize()
		@contents = []
	end

	def add(shopItem)
		if(shopItem.class <= Item)
			@contents << shopItem
			puts "Bought #{shopItem.name}! Today's price: $#{sprintf("%.2f",shopItem.discount())}."
		end
	end

	def totalSales()
		sales = 0
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

	def to_s()
		
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

	def to_s()
		to
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
store = []
store << Fruit.new("Bananas", 10)
store << Item.new("Orange Juice", 10)
store << Item.new("Rice", 1)
store << Houseware.new("Vacuum Cleaner", 150)
store << Item.new("Anchovies", 2)

while (customerSelection != "done")
	puts "What you like to purchase? Type the number of the item to add it to your cart."
	itemNumber = 1
	store.each do |storeItem|
		puts "#{itemNumber++} - #{store[itemNumber-1]}"
	end
	puts "view - See the items inside your cart"
	puts "done - Leave the store"
	gets customerSelection
	if (customerSelection.class == 0.class && customerSelection > 0 && customerSelection <= store.length)
		myCart.add(store[customerSelection-1])
	elsif (customerSelection == "view")
		puts myCart.to_s()
	end
end

puts "Your total comes to $#{sprintf("%.2f",myCart.totalSales())} with any discounts. Thank you for shopping at IronStore!"
