require 'csv.rb'


module States

	@all_states = []
 	CSV.open("states-wo-us.csv").each { |line|  
		eval ("#{line[0]}='#{line[0]}'")
    	@all_states << line[0]
        #eval ("def #{line[1]}; line[1]; end")
 	}
	def all_states
  		@all_states
	end


end