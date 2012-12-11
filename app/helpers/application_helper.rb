module ApplicationHelper

	def flash_class(type)
		case type
		when :alert
			"alert-error"
		when :notice 
			"alert-success"
		else
			""
		end # end case
	end # end flash_class
end # end class
