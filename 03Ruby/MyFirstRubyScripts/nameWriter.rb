puts "What's your name?"
name = gets.chomp
IO.write('name.txt', name)