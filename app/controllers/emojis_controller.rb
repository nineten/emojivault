class EmojisController < ApplicationController

	def index
		redirect_to root_path
	end

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

			format.json {
				render json: {
					name: @emoji.name,
					url: emoji_url(@emoji),
					tags: @emoji.tag_list
				}
			}
		end
	end

	private
		def emoji_params
			params.require(:emoji).permit(:image_file, :name, :tag_list)
		end

end
