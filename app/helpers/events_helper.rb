module EventsHelper
	def location_select
		collection_select(:event, :location_id, State.all, :id, :name)
	end

	def json_events(events)
		setup = {}
		events_array = []
		events.each do |e| 
			outcomes = []
=begin
			e.outcomes.each { |o| 
				outcomes << { :candidate => o.candidate.name, :delta => o.delta }
			}
=end
		    month, day, year = e.event_date.split("/")
			events_array << { :name => e.caption, 
				              :month => month, 
				              :date => day, 
				              :type => "debate",
				              :year => year, 
				              :description => e.event_description,
				              :outcomes => outcomes  }
		end
		setup[:events] = events_array
		setup.to_json.html_safe
	end
end
