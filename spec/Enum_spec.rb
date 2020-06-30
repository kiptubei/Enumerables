require_relative "../my_enumerables.rb"

describe Enumerable do
    describe "#my_each" do
			let (:array){[1,2,3,4]}
			context "when an array is given" do
        it "it return the original array" do
            expect(array.my_each{|item| print item}).to eql(array)  
        end
        it "check the output if it the same as each method" do
            expect{array.my_each{|item| puts item+1}}.to output("2\n3\n4\n5\n").to_stdout
				end\
			end
		end

		describe "#my_each_with_index" do
			let (:array) { [1, 2, 3, 4]}
			let (:string_array) { %w(cat dog wombat) }
			context "when an array is given" do
				it "outputs the idexes with their items" do
					expect {array.my_each_with_index { |item, index| puts "#{item} => #{index}" }}.to output("1 => 0\n2 => 1\n3 => 2\n4 => 3\n").to_stdout
				end
			end

			context "when an array of strings is given" do
				it "outputs strings with their indexes" do
					expect {string_array.my_each_with_index { |item, index| puts "#{item} => #{index}"}}.to output("cat => 0\ndog => 1\nwombat => 2\n").to_stdout
				end
			end
		end
end