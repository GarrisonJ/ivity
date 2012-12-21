module HappeningsHelper

	def show_tag_list(happening)
		raw happening.tag_list.map { |t| link_to t, tag_path(t) }.join(', ')
	end
end
