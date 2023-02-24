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

describe "my_transpose" do 
    subject(:arr1) { [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
    ] }
    it "should not use built-in #transpose" do 
        expect(arr1).not_to receive(:transpose)
    end

    it "should return a transposed version of original matrix" do 
        expect(arr1.my_transpose).to eq( [
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
    ] )
    end

    it "should not mutate original array" do 
        expect(arr1).not_to be(arr1.my_transpose)
    end
end

describe "stock_picker" do
    subject(:stocks) { [100, 110, 105, 120, 115] }
    context "if no profitable days exist" do
        it "should return an empty array" do
            expect(stock_picker([100, 90, 80, 70]).length).to eq(0)
        end
    end
    context "if there are profitable days" do
        it "should return an array containing two days" do
            expect(stock_picker(stocks).length).to eq(2)
        end
    end
    it "should return an array containing the two days resulting in max profit" do
        expect(stock_picker(stocks)).to eq([0, 3])
    end
end

describe Towers do 
    subject(:tower) { Towers.new(5) }
    describe "initialize" do 
        it "should accept a number of rings" do 
            expect(tower.levels).to eq(5) 
        end

        it "should set up initial board" do 
            expect(tower.board).to eq( [ 
                [5,4,3,2,1],
                [],
                []
            ])
        end
    end

    describe "move" do 
        it "should take in two integer arguments" do 
            expect { tower.move(1, 2) }.to_not raise_error
            expect { tower.move(1) }.to raise_error(ArgumentError)
            expect { tower.move }.to raise_error(ArgumentError)
        end

        it "should modify the board" do 
            tower.move(0, 1)
            expect(tower.board).to eq([ 
                [5,4,3,2],
                [1],
                []
            ])
        end
    end

    describe "won?" do 
        subject(:tower2) { Towers.new(1) } 
        it "should return false if game is not over" do
            expect(tower2.won?).to eq(false)
        end

        it "should return true if game is over" do
            tower2.move(0, 2)
            expect(tower2.won?).to eq(true)
        end
    end
end