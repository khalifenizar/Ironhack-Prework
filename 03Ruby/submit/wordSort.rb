def wordSort(unsorted)
  # You can use the String class directly
  if(unsorted.class == String)
		#remove non-alpha characters and spaces
		splitWords = (unsorted.gsub(/[^a-z ]/i,'')).split(' ')
		#sort with custom comparator
		return splitWords.sort{ |a,b|  a.upcase <=> b.upcase}
	end
end

puts wordSort("Fools fall for foolish follies.")
