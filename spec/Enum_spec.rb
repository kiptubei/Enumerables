require_relative '../my_enumerables.rb'

describe Enumerable do
	let(:array) { [1, 2, 3, 4] }
  describe '#my_each' do
    let(:array) { [1, 2, 3, 4] }
    context 'when an array is given' do
      it 'it return the original array' do
        expect(array.my_each { |item| print item }).to eql(array)
      end
      it 'check the output if it the same as each method' do
        expect { array.my_each { |item| puts item + 1 } }.to output("2\n3\n4\n5\n").to_stdout
      end\
    end
  end

  describe '#my_each_with_index' do
    let(:array) { [1, 2, 3, 4] }
    let(:string_array) { %w[cat dog wombat] }
    context 'when an array is given' do
      it 'outputs the idexes with their items' do
        expect { array.my_each_with_index { |item, index| puts "#{item} => #{index}" } }.to output("1 => 0\n2 => 1\n3 => 2\n4 => 3\n").to_stdout
      end
      it 'outputs strings with their indexes' do
        expect { string_array.my_each_with_index { |item, index| puts "#{item} => #{index}" } }.to output("cat => 0\ndog => 1\nwombat => 2\n").to_stdout
      end
    end
  end

  describe '#my_select' do
    let(:array) { [1, 2, 3, 4] }
    context 'when array given' do
      it 'select the items from array' do
        expect(array.my_select { |item| item > 2 }).to eq([3, 4])
      end
    end
  end
  describe '#my_all?' do
    let(:array) { [1, 2, 3, 4] }
    let(:array_with_nil) { [1, 2, 3, nil] }
    let(:array_of_zeroes) { [0, 0, 0, 0] }
    context 'when block is  given' do
      it 'return true if all items are true' do
        expect(array.my_all? { |item| item > 2 }).to eq(false)
        expect(array.my_all? { |item| item.class == Integer }).to eq(true)
      end
    end
    context 'when there is no block given' do
      it "return true if the array dosn't containe a nil value" do
        expect(array.my_all?).to eq(true)
        expect(array_with_nil.my_all?).to eq(false)
      end
      it 'return true if all the elements equal to the param given' do
        expect(array.my_all?(1)).to eq(false)
        expect(array_of_zeroes.my_all?(0)).to eq(true)
      end
    end
  end
  describe '#my_any?' do
    let(:array) { [1, 2, 3, 4] }
    let(:array_of_nils) { [nil, nil, nil] }
    context 'when block given' do
      it 'return true if just one item is true' do
        expect(array.my_any? { |item| item > 2 }).to eq(true)
      end
      it 'return false if all  items are false' do
        expect(array.my_any? { |item| item > 7 }).to eq(false)
      end
    end
    context 'when block given' do
      it 'return true if one item is equal to the given param' do
        expect(array.my_any?(1)).to eq(true)
      end
      it 'return true if no param is given and not all values are equal to nil' do
        expect(array.my_any?).to eq(true)
        expect(array_of_nils.my_any?).to eq(false)
      end
    end
	end
	
	describe '#my_none?' do
		context 'when block given' do
			it 'returns true if no item is equal to the given argument' do
				expect(array.my_none?(7)).to eq(true)
			end

			it 'returns false if at least one item is equal to the given argument' do
				expect(array.my_none?(2)).to eq(false)
			end
		end		
	end

	describe '#my_count' do
		context 'when no argument is given' do
			it 'returns the count of the condition passed into the block' do
				expect(array.my_count { |item| item > 2 }).to eq(2)
			end

			it 'returns the size of the array if no block is given' do
				expect(array.my_count).to eq(4)
			end
		end

		context 'when argument is given' do
			it 'returns the count of the value passed in the argument' do
				expect(array.my_count(3)).to eq(1)
			end
		end
	end

	describe '#my_inject' do
		
	end
end
