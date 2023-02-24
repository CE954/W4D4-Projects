class Array
    def my_uniq 
        hash = Hash.new
        self.each {|ele| hash[ele] = true}
        hash.keys
    end

    def two_sum 
        result = []
        self.each_with_index do |num_1, idx_1|
            self.each_with_index do |num_2, idx_2|
                if idx_2 > idx_1 && num_1 + num_2 == 0
                    result << [idx_1, idx_2]
                end
            end
        end
        return result
    end

    def my_transpose
        result = Array.new(self.length) {Array.new(self.length)}
        self.each_with_index do |row, i| 
            row.each_with_index do |ele, j| 
                result[j][i] = ele
            end
        end
        result
    end
end


def stock_picker(arr)
    profit = 0
    indices = [0, 1]
    arr.each_with_index do |num_1, idx_1|
        arr.each_with_index do |num_2, idx_2|
            #difference = num_1 + num_2
            if idx_2 > idx_1 && num_2 - num_1 > profit
                profit = num_2 - num_1
                indices[0] = idx_1
                indices[1] = idx_2
            end
        end
    end
    if profit == 0
        return []
    else
        return indices
    end
end

class Towers
    attr_reader :levels, :board
    def initialize(levels)
        @levels = levels
        @board = Array.new(3) { Array.new }
        (1..levels).each do |i|
            @board[0] << (levels - i + 1)
        end
    end

    def get_input
        puts "Enter first index"
        index_1 = gets.chomp.to_i
        puts "Enter second index"
        index_2 = gets.chomp.to_i
        return [index_1,index_2]
    end

    def move(idx_1, idx_2)
        @board[idx_2] << @board[idx_1].pop
    end

    def won? 
        sorted = []
        (1..levels).each do |i|
            sorted << (levels - i + 1)
        end
        if @board[2] == sorted
            return true 
        else  
            false 
        end
    end
end