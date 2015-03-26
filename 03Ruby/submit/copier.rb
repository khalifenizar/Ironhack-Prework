puts "What's the source file?"
source = gets.chomp
puts "What's the destination file?"
IO.write(gets.chomp, IO.read(source))