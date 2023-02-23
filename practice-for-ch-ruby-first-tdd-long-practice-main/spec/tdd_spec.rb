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

describe "two_sum" do
    subject(:arr1) { [-1,0,2,-2,1] }
    it "should return a two-dimensional array containing pairs that sum to zero" do
        expect(arr1.two_sum).to eq([[0, 4], [2, 3]])
    end

    it "should sort the indices smallest to greatest" do 
        arr_2 = [-1, 1]
        expect(arr_2.two_sum[0][0]).to be < (arr_2.two_sum[0][1])
    end
end
