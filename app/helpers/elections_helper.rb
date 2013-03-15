module ElectionsHelper

	def election_year(election)
        election.date.year
    end

    def campaign_start_day(election)
    	1
    end

    def campaign_start_month(election)
    	election.date.month-2
    end

    def election_cycle
    	3
    end

    def vote_table_id(election)
        "vt_#{election.id}"
    end

    def vote_table(candidates)
        out =  %Q[<table class="table table-bordered" >]
        out += %Q[<thead><td>Candidate</td><td>Popular Votes</td><td>Electoral Votes</td></tr></thead>]
        candidates.each do |c|
            out += %Q[<tr><td width='35%'>#{c.name}</td><td>#{c.voting_profiles.collect { |x| x.votes }.reduce(:+)}</td>\
                        <td>#{c.electoral_votes}</td>\
                        </tr>]
        end
        out += "</table>"
        out.html_safe
    end
end
