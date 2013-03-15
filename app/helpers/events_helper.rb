module EventsHelper
	include Rails.application.routes.url_helpers 
	def location_select
		collection_select(:event, :location_id, State.all, :id, :name)
	end

	#
	# Generate HTML id attribute value of a calendar day
	#
	def id_tag_for(event) 
    	"c3d_#{event.date.month}_#{event.date.day}_#{event.date.year}"
  	end

	#
	# Generate a bootstrap popover for an event
	#
	# Use form helper to generate button tag to avoid having to think too
	# much about quotes.
	# If you generate button as such and simply #{} eval below, life
	# is much easier.
	#
	# First jquery invocation generates popover. Second one simpply add a class 
	# to calendar day to reflect the type of event that occurs on that day, ie.
	# events of color-coded.
	#
  	def popover(election, event, active = false)
  		buttons = button_tag("Ok", 
  			       :id=> "#{id_tag_for(event)}b",
  			       :class=>'btn btn-success btn-mini',
  			       :onclick=>"$('##{id_tag_for(event)}').popover('hide');$.get('#{outcome_path(event, "ok")}', { }, 'js');"
  			       ).gsub(/'/, "&quot;").gsub(/"/, "'")
  		outcome  = "Bush +1, Gore -1"
      activate = active ?  %Q[$('##{id_tag_for(event)}').popover('show');] : ""
  		%Q[
  	    $('##{id_tag_for(event)}').popover(
  	    		{ 	html:true,
        			placement:'bottom',
        			trigger: 'click',
        			title: '#{event.name}',
        			content:  function(){ 
        				return "<span>#{event.description}</span><br/>#{outcome}<br/>#{buttons}";
        			}
				}
        );
      #{activate}
    	$('##{id_tag_for(event)}').addClass('#{event.event_type}');
    	].html_safe
    end
end
