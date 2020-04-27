require './polynomynal'

polynomynal1 = Polynomynal.new([5, 0, 10, 6])
polynomynal2 = Polynomynal.new([1, 2, 4])


# add polynomynal 1 to the polynomynal 2 in OOP manner
# polynomynal1.add_polynomynal(polynomynal2)

# I assume polynomynals are sotred as arrays
# def polynomial_reduction(poly1, poly2)
#     # raise Error, 'The input should be an array' unless (poly1.instance_of? Array && poly2.instance_of? Array)
   

#     # element wise addition (hint: the last line of a function in Ruby is returned by default)
#     [poly1, poly2].transpose.map { |x| x.reduce(:+) } 
# end

# polynomial_reduction([5, 0, 10, 6], [1, 2, 4])


