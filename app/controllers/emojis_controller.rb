class EmojisController < ApplicationController

	def create
		new_emoji = Emoji.new(emoji_params)
		new_emoji.save!
		redirect_to emoji_path(new_emoji)
	end

	def show
		@emoji = Emoji.find(params[:id])
		respond_to do |format|
			format.gif {
				send_data @emoji.img_binary, :type => @emoji.content_type, :filename => @emoji.filename, :disposition => 'inline'
			}
			format.html {
				redirect_to emoji_path(@emoji, format: :gif)
			}
		end
	end

	private
		def emoji_params
			params.require(:emoji).permit(:image_file, :name)
		end

end
