class Letter

	def initialize(str)
		str.gsub!(/[-!?,.;:"\s+]/, "")
		str.gsub!(/\d/, "")
		str = str.downcase.split(//)
		@string = str
	end 
	
	def calculateBeauty

		str_arr = string_sort(@string)

		count_arr = []
		count = 1
		j = 0
		str_arr.each_index do |i|
			if str_arr[i] == str_arr[i+1]
				count+=1
			else
				count_arr[j] = count
				j+=1
				count=1
			end
			count_arr[j] = count if i == str_arr.length-2
		end

		count_arr = number_sort(count_arr)

		beauty = 26
		sum = 0

		count_arr.each do |el|
			sum += beauty * el
			beauty -= 1
		end

		sum

	end

	private

		def number_sort(arr)
			arr.each_index do |i|
				swapped = false
	          arr.each_index do |j|
	          	break if j == arr.length-1
	            if (arr[j] < arr[j+1])
	              a = arr[j]
	              arr[j] = arr[j+1]
	              arr[j+1] = a
	              swapped = true
	            end 
	         	end 
	        break if(!swapped)
			end 	 
      arr 
		end 

		def string_sort(str)
			str.each_index do |i|
				swapped = false
          str.each_index do |j|
          	break if j == str.length-1
            if (str[j].ord > str[j+1].ord)
              a = str[j]
              str[j] = str[j+1]
              str[j+1] = a
              swapped = true
            end 
         	end 
        break if(!swapped)
			end 
      str
		end

end

puts "Hi!"
while (true)
	puts "Enter your string, please.."
	puts "or enter 0 to exit"
	str = gets.chomp
	if str != 0.to_s
		letter = Letter.new(str)
		puts "The maximal beauty of your string is"
		puts letter.calculateBeauty
	else
		break
	end
end 