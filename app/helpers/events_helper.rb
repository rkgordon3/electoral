module EventsHelper
	def location_select
		collection_select(:event, :location_id, State.all, :id, :name)
	end

	def json_events
		puts "++++++++++++++++++++++++++++++++ json_events"
		events = []
		Event.all.each do |e| 
			events << { :name => e.name, :month => e.date.month, :date => e.date.day, :year => e.date.year }
		end
		events.to_json.html_safe
	end
end
