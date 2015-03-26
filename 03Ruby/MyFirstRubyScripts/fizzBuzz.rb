num = 1
while num <= 100
	string = ""
	if(num % 3 == 0)
		string = string + "Fizz"
	end
	if(num % 5 == 0)
		string = string + "Buzz"
	end
	if(string != "")
		puts string
	else
		puts num
	end
	num = num + 1
end