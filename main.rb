require './polynomynal'

polynomynal1 = Polynomynal.new([5, 0, 10, 6])
polynomynal2 = Polynomynal.new([1, 2, 4])

# add polynomynal 1 to the polynomynal 2 in OOP manner
puts('We can add two plynomynals in OOP manner using #add_polynomynal method')
puts(polynomynal1.add_polynomynal(polynomynal2))

puts('We can create a new plynomynal using factory method providing two coefficients arrays')
puts(Polynomynal.create_polynomynal([1, 2, 3, 5, 10], [90, 1, 4]))

puts('We can print a polynomynal using toString (to_s) method')
puts("Coefficients: #{polynomynal1.coefficient_arr}")
puts(polynomynal1)

puts('Thanks! :D')

