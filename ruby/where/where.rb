class Array
  def where(supplied_hash)
  	self.select do |hsh|
  		valid_candidate = true
	  	supplied_hash.each_pair do |k,v|
  			if !(hsh[k] == v || (hsh[k].is_a?(String) && hsh[k].match(v)))
  				valid_candidate = false
  				break
  			end
  		end
			hsh if valid_candidate
  	end
  end

end