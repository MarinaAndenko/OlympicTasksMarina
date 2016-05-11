class Letter

	def initialize(str)
		@array = []
		str.gsub!(/[, ]/, " ")
		str = str.split(" ")
		str.each {|el| @array << el.to_i }
	end 
	
	def hashCount
		@array.sort!
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
		puts hash
	end

end

puts "Hi!"
while (true)
	puts "Enter your array, please.."
	puts "or enter e to exit"
	str = gets.chomp
	if str != 'e'
		letter = Letter.new(str)
		puts "The hash in result is "
		puts letter.hashCount
	else
		break
	end
end 