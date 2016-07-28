module ApplicationHelper

	def bootstrap_class_for(flash_type)
	  case flash_type
	  when "success"
	    "alert-success"   # Green
	  when "error"
	    "alert-danger"    # Red
	  when "alert"
	    "alert-warning"   # Yellow
	  when "notice"
	    "alert-info"      # Blue
	  else
	    flash_type.to_s
	  end
	end

	def pluralize_like link
		if link.get_upvotes.size > 1
			"Like".pluralize 
		else
			"Like"
		end
	end

	def pluralize_dislike link
		if link.get_downvotes.size > 1
			"Dislike".pluralize 
		else
			"Dislike"
		end
	end
end
