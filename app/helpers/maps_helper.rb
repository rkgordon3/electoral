module MapsHelper

	def json_electoral_votes
	    votes = {}
	    State.all.each { |s|   votes[s.state_tag] = s.electoral_votes.to_s }
	    votes.to_json.html_safe
	end
	def json_voting_profiles
		profiles = {}
		State.all.each  do  |s| 
			profiles[s.state_tag] = []
			s.voting_profiles.each do  |vp| 
				profiles[s.state_tag] << { :name => vp.candidate.name, :votes => vp.votes }
			end
		end
		profiles.to_json.html_safe
	end

	def json_percent_differential
		percent_diff_map = {}
		gore = Candidate.find_by_name("Gore")
		bush = Candidate.find_by_name("Bush")
		percent_diff_map['red_states'] = {}
		State.all.select { |s| s.winner == bush }.each { |s| 
			diff = s.differential(bush)
		   percent_diff_map['red_states'][s.state_tag] = diff if diff > 0
		}
		percent_diff_map['blue_states'] = {}
		State.all.select { |s| s.winner == gore }.each { |s| 
			diff = s.differential(gore)
		   percent_diff_map['blue_states'][ s.state_tag] =  diff  if diff > 0 
		}
		percent_diff_map.to_json.html_safe
	end

	def election_year
        "2008"
    end

    def election_cycle
    	3
    end
end
