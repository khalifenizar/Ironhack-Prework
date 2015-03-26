def wordSort(unsorted)
	if(unsorted.class == ''.class)
		#remove non-alpha characters and spaces
		splitWords = (unsorted.gsub(/[^a-z ]/i,'')).split(' ')
		#sort with custom comparator
		return splitWords.sort{ |a,b|  a.upcase <=> b.upcase}
	end
end

puts wordSort("Fools fall for foolish follies.")