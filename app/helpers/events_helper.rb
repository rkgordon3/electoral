module EventsHelper
	def location_select
		collection_select(:event, :location_id, State.all, :id, :name)
	end

	def json_events
		setup = {}
		events_array = []
		Event.all.each do |e| 
			events_array << { :name => e.name, :month => e.date.month, :date => e.date.day, :year => e.date.year }
		end
		setup[:events] = events_array
		setup.to_json.html_safe
	end
end
