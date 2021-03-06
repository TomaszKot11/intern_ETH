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
            subject { polynomynal.add_polynomynal(polynomynal_greater_degree).coefficient_arr }
            context 'positive coefficients' do 
                let(:polynomynal_greater_degree) { Polynomynal.new([1, 3, 4, 5, 7, 1]) }

                it 'should return proper polynomynal' do 
                    expect(subject).to match_array([1, 3, 5, 7, 12, 7])
                end
            end

            context 'negative coefficients' do 
                let(:polynomynal_greater_degree) { Polynomynal.new([-1, -3, -4, -5, -7, -1]) }

                it 'should return proper polynomynal' do 
                    expect(subject).to match_array([-1, -3, -3, -3, -2, 5])
                end
            end
        end

        context 'polynomynals with the same degree provided' do
            subject { polynomynal.add_polynomynal(polynomynal_same_degree).coefficient_arr }
            context 'positive coefficients' do 
                let(:polynomynal_same_degree) { Polynomynal.new([3, 4, 5, 1]) }

                it 'should return proper polynomynal' do
                    expect(subject).to match_array([4, 6, 10, 7])
                end
            end

            context 'negative coefficients' do
                let(:polynomynal_same_degree) { Polynomynal.new([-3, -4, -5, -1]) }

                it 'should return proper polynomynal' do 
                    expect(subject).to match_array([-2, -2, 0, 5])
                end
            end
        end

        context 'order of polynomynal addition should not change the result' do 
            let(:polynomynal_1) { Polynomynal.new([1, 5, 1, 5]) }
            let(:polynomynal_2) { Polynomynal.new([3, 5, 6, 7]) }
            let(:result) { [4, 10, 7, 12] }


            context 'polynomynal_1 + polynomynal_2' do
                it 'should return proper presult' do 
                    expect(polynomynal_1.add_polynomynal(polynomynal_2).coefficient_arr).to match_array(result)
                end
            end

            context 'polynomynal_2 + polynomynal_1' do 
                it 'should return proper result' do 
                    expect(polynomynal_2.add_polynomynal(polynomynal_1).coefficient_arr).to match_array(result)
                end
            end
        end
    end

    # since add_polynomynal is well tested I make some assumption
    # not to test so much this factory method
    context 'self.create_polynomynal' do 
        let(:coefficient_arr_1) { [2, 6, 7, 8] }
        let(:coefficient_arr_2) { [2, 5, 1, 5, 7] }
        subject { Polynomynal.create_polynomynal(coefficient_arr_1, coefficient_arr_2) }

        it 'should create proper polynomynal by two coefficients array addition' do 
            expect(subject.coefficient_arr).to match_array([2, 7, 7, 12, 15])
        end
    end

    context '#to_s' do 
        let(:polynomynal) { Polynomynal.new([1, 2, 1, 5, -10, 5, 1]) }
        let(:polynomynal_string) { '1x^6 + 2x^5 + 1x^4 + 5x^3 - 10x^2 + 5x^1 + 1' }

        it 'should return properly formatted polynomynal string' do 
            expect(polynomynal.to_s).to eq(polynomynal_string)
        end
    end
    # We do not test private methods - we test them by publi methods and their effects
end
