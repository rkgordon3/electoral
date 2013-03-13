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
end
