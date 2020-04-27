require 'rspec'
require './polynomynal'

# we will test only polynomynal class
RSpec.describe 'Polynomynal' do 

    context '#initialization' do
        let(:coefficients_arr) { [-100, 123, 12, 34, 6] }
        it 'should initialize polynomynal with provided array of coefficients' do 
            expect(Polynomynal.new(coefficients_arr).coefficient_arr).to match_array(coefficients_arr)
        end
    end

    context '#add_polynomynal' do
        let(:polynomynal) { Polynomynal.new([1, 2, 5, 6]) }
        
        context 'not Polynomynal instance input provided' do 
            it 'should raise error with proper message' do 
                expect { polynomynal.add_polynomynal('Not polynomynal object') }.to raise_error(an_instance_of(ArgumentError).and having_attributes(message: 'The input should be a polynomynal'))
            end
        end

        context 'polynomynals with smaller degree provided' do
            subject { polynomynal.add_polynomynal(polynomynal_smaller_degree).coefficient_arr }
            context 'positive coefficients' do 
                let(:polynomynal_smaller_degree) { Polynomynal.new([1, 2, 3]) }
                let(:result) { [1, 3, 7, 9] }

                it 'should return proper polynomynal' do 
                    expect(subject).to match_array(result)
                end
            end

            context 'negative coefficients' do 
                let(:polynomynal_smaller_degree) { Polynomynal.new([-1, -2, -3]) }
                let(:result) { [1, 1, 3, 3] }

                it 'should return proper polynomynal' do 
                    expect(subject).to match_array(result)
                end
            end
        end

        context 'polynomynals with greater degree provided' do 

            context 'positive coefficients' do 

            end

            context 'negative coefficients' do 
            
            end
        end

        context 'polynomynals with the same degree provided' do

            context 'positive coefficients' do 

            end

            context 'negative coefficients' do

            end
        end
    end

    context '#to_s' do 
        let(:polynomynal) { Polynomynal.new([1, 2, 1, 5, -10, 5, 1]) }
        let(:polynomynal_string) { '1x^6 + 2x^5 + 1x^4 + 5x^3 - 10x^2 + 5x^1 + 1' }

        it 'should return properly formatted polynomynal string' do 
            expect(polynomynal.to_s).to eq(polynomynal_string)
        end
    end
end
