require "tdd"
require "rspec"

describe "my_uniq" do 
    subject(:arr1) { [1,2,1,3,3] }
    it "should not use built-in #uniq" do 
        expect(arr1).not_to receive(:uniq)
    end

    it "should return array with no duplicates" do 
        expect(arr1.my_uniq).to eq([1,2,3])
    end


end
