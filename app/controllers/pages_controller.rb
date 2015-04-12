class PagesController < ApplicationController

	def index
		@result = []
	end

	def search
		@result = Emoji.tagged_with(search_params[:tag_list])
		@search = search_params[:tag_list]
		render "index"
	end

	private
		def search_params
			params.require(:search).permit(:tag_list)
		end

end
