 class Polynomynal # OOP
    attr_reader :coefficient_arr # getter for coefficient_arr instance variable

    def initialize(coefficient_arr)
        @coefficient_arr = coefficient_arr
    end

    # just to stick with the task  (this method is somehow redundant)
    # I assume that to tick with OOP pattern I will create a factory method 
    # taking two arrays of coefficients and returning Polynomynal instance
    # hint: self.name_of_method is class method
    def self.create_polynomynal(coefficients_1, coefficients_2) 
        Polynomynal.new(coefficients_1).add_polynomynal(Polynomynal.new(coefficients_2))
    end
    
    # This is a solution for a task in OOP manner
    # benath is the solution with two input files
    def add_polynomynal(polynomynal)
        raise ArgumentError, 'The input should be a polynomynal' unless polynomynal.instance_of? Polynomynal
        self.add_two_coefficients_arrays(@coefficient_arr, polynomynal.coefficient_arr)
    end

    # Java's toString() method :) 
    def to_s
        str = '';
        coefficient_arr_size = coefficient_arr.size

        @coefficient_arr.each_with_index do |el, idx|
            sign = el < 0 || idx == 0 ? '' : ' + '
            iks_add = coefficient_arr_size - (idx + 1) > 0 ? "x^#{coefficient_arr_size - (idx + 1)}" : ''
            str += "#{sign}#{el.to_s.gsub('-', ' - ')}#{iks_add}" if el != 0
        end

        str
    end

    private 

    def add_two_coefficients_arrays(coeffients_1, coefficients_2)
        # C-style - first declare variables
        poly1_arr_size = coeffients_1.size 
        poly2_arr_size = coefficients_2.size
        smaller_arr = poly1_arr_size <= poly2_arr_size ? coeffients_1 : coefficients_2 # reference types
        # make two arrays equal (loop) - push to the head of an array 0
        (poly1_arr_size - poly2_arr_size).abs.times { smaller_arr.unshift(0) } 
        # element wise addition (hint: the last line of Ruby's function is returned)
        Polynomynal.new([coeffients_1, coefficients_2].transpose.map { |x| x.reduce(:+) })
    end
end