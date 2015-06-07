class PagesController < ApplicationController

	def index
		@result = []
	end

	def search
		@is_mobile = is_mobile?

		if !params[:search].nil?
			@result = Emoji.tagged_with(split_into_array(search_params[:tag_list]))
			@search = search_params[:tag_list]
		else
			@result = []
		end
		render "index"
	end

	private
		def search_params
			params.require(:search).permit(:tag_list) 
		end

		def split_into_array(tag_list)
			tag_list.split(/-|_|,|:|;| /)
		end
end
