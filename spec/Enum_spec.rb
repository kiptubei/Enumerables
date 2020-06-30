require "../my_enumerables.rb"

describe Enumerable do
    describe "#my_each" do
        let (:array){[1,2,3,4]}
        context "when an array is given" do
        it "it return the original array" do
            expect(array.my_each{|item| print item}).to eql(array)  
        end
        it "check the output if it the same as each method" do
            expect{array.my_each{|item| puts item+1}}.to output("2\n3\n4\n5\n").to_stdout
        end
    end
end
end