module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Rental App"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

	def debug_all &block
		excluded_vars = ["@lookup_context", "@view_context_class", "@action_has_layout"]
		controller.instance_variables.each do |var|
		   unless var.at(1)== "_" or excluded_vars.include?(var)
		     yield var
		    end
		 end
	end
end
