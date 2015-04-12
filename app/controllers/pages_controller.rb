class PagesController < ApplicationController

	def index
		@result = []
	end

	def search
		if !params[:search].nil?
			@result = Emoji.tagged_with(search_params[:tag_list])
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

end
