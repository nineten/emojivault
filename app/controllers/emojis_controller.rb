class EmojisController < ApplicationController
	before_action :authenticate_user!, :except => [:show]

	def index
		redirect_to root_path
	end

	def create
		emoji_params[:image_file].each do |emoji_file|
			filename = emoji_file.original_filename.gsub(/\.gif/, '')
			tag_list = split_into_array(emoji_params[:tag_list])
			split_into_array(filename).each do |tag|
				tag_list << tag if !tag_list.include?(tag)
			end
			new_emoji = Emoji.new({:image_file => emoji_file, :name => filename, :tag_list => tag_list})
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

	def edit
		@emoji = Emoji.find(params[:id])
	end

	def update
		@emoji = Emoji.find(params[:id])
		@emoji.update_attributes(emoji_params)
		
		redirect_to edit_emoji_path(@emoji)
	end
	
	private
		def emoji_params
			params.require(:emoji).permit(:name, :tag_list, :image_file => [])
		end

		def split_into_array(tag_list)
			tag_list.split(/-|_|,|:|;| /)
		end
end
