class Car
  attr_accessor :color

  def initialize(color)
    @color = color
  end

  def honk
    puts "Beeeeeeeeep!"
  end
end

my_car = Car.new "yellow"
other_car = Car.new "brown"

my_car.color = "grey"

puts my_car.color
puts other_car.color