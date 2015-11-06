class Array
  def where(supplied_hash)
  	self.select do |hash|
  		valid_candidate = true
	  	supplied_hash.each_pair do |k,v|
  			if !(hash[k] == v || (hash[k].is_a?(String) && hash[k].match(v)))
  				valid_candidate = false
  				break
  			end
  		end
			hash if valid_candidate
  	end
  end

end