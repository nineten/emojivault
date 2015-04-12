class EmojisController < ApplicationController

	def index
		redirect_to root_path
	end

	def create
		emoji_params[:image_file].each do |emoji_file|
			filename = emoji_file.original_filename.gsub(/\.gif/, '')
			new_emoji = Emoji.new({:image_file => emoji_file, :name => filename, :tag_list => emoji_params[:tag_list]})
			new_emoji.save!
		end

		redirect_to root_path
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
					tag_list: @emoji.tag_list
				}
			}
		end
	end

	private
		def emoji_params
			params.require(:emoji).permit(:name, :tag_list, :image_file => [])
		end

end
