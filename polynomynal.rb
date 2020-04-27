# To stick to OOP programming 
class Polynomynal
    attr_reader :coefficient_arr # getter for coefficient_arr instance variable

    def initialize(coefficient_arr)
        @coefficient_arr = coefficient_arr
    end
    
    # This is a solution for a task in OOP manner
    # benath class definition there is a function with two input arrays :)
    def add_polynomynal(polynomynal)
        raise Error, 'The input should be a polynomynal' unless polynomynal.instance_of? Polynomynal
        # C-style - first declare variables
        poly1_arr_size = @coefficient_arr.size 
        poly2_arr_size = polynomynal.coefficient_arr.size
        smaller_arr = poly1_arr_size <= poly2_arr_size ? @coefficient_arr : polynomynal.coefficient_arr # reference types
        # make two arrays equal (loop)
        (poly1_arr_size - poly2_arr_size).times { smaller_arr << 0 } 
        # element wise addition (hint: the last line of Ruby's function is returned)
        Polynomynal.new([@coefficient_arr, polynomynal.coefficient_arr].transpose.map { |x| x.reduce(:+) })
    end

    # just to stick with the task specification
    # (this methods does not work on Polynomynal inner state so this is not clear OOP)
    # def add_two_polynomynals()

    # Java's toString() method :) 
    def to_s
        str = '';
        coefficient_arr_size = coefficient_arr.size

        @coefficient_arr.each_with_index do |el, idx|
            sign = el < 0 || idx == 0 ? '' : '+'
            iks_add = coefficient_arr_size - (idx + 1) > 0 ? "x^#{coefficient_arr_size - (idx + 1)}" : ''
            str += "#{sign}#{el}#{iks_add}"if el != 0
        end

        str
    end
end