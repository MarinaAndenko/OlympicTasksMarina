class HashCount
	def initialize(arr)
		@array = arr
	end 	
	def hashCount
		array = convert(@array)
		array.sort!
		hash = {}
		count = 1
		@array.each_index do |i|
			if @array[i] == @array[i+1]
				count += 1
			else
				hash.merge!(@array[i] => count)
				count = 1
			end 
		end 
		hash
	end
	private
	 	def convert(arr)
	 		new_array = []
			arr.each {|el| new_array << el.to_i }
			new_array
	 	end 
end

a = HashCount.new([1, 2, 3])
a.hashCount