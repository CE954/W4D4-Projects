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
end