# To stick to OOP programming 
class Polynomynal
    attr_reader :coefficnet_arr # reader for coefficient_arr 
    
    def initialize(coefficnet_arr)
        @coefficnet_arr = coefficnet_arr
    end
    
    # This is a solution for a task in OOP manner
    # benath class definition there is a function with two input arrays :)
    def add_polynomynal(polynomynal)
        raise Error, 'The input should be a polynomynal' unless polynomynal.instance_of? Polynomynal
        # C-style - first declare variables
        poly1_arr_size = poly1.size 
        poly2_arr_size = poly2.size
        smaller_arr = poly1_arr_size <= poly2_arr_size ? poly1 : poly2 # reference types
        # make two arrays equal
        (poly1_arr_size - poly2_arr_size).times { smaller_arr << 0 } 
    end

    # just to stick with the task specification
    # (this methods does not work on Polynomynal inner state so this is not clear OOP)
    # def add_two_polynomynals()

    # Java's toString() method :) 
    def to_s

    end
end