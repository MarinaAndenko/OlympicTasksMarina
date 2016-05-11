class Letter
  def initialize(str)
    @string = str
  end
  def calculate_beauty
    str = convert(@string)
    str_arr = string_sort(str)
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
  def convert(str)
    str.gsub!(/[-!?,.;:"'\s+]/, "")
    str.gsub!(/\d/, "")
    str = str.downcase.split(//)
  end
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
      break unless swapped
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
      break unless swapped
    end
    str 
  end 
end