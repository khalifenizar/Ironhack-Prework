def power_formula(base_chemical)
  sugar = base_chemical * 500
  spice = sugar / 1000
  everything_nice = sugar / 100
  return sugar, spice, everything_nice
end


chemical_x = 10000
blossom, buttercup, bubbles = power_formula(chemical_x)

puts "Using the value #{chemical_x} as our base chemical"
puts "We get values of #{blossom} for blossom, #{buttercup} for buttercup, and #{bubbles} for bubbles."
puts "I got a bad feeling about #{power_formula(chemical_x)}"