require 'event.rb'
module Events

	%w(event policy).each { |m| 
  		define_method(m.to_sym) { |caption| Object::const_get(m.capitalize).new(caption) }
	}
end