# == Schema Information
#
# Table name: emojis
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  filename     :string
#  content_type :string
#  img_binary   :binary
#

class Emoji < ActiveRecord::Base
	acts_as_taggable 

	def image_file=(input_data)
		self.filename = input_data.original_filename
		self.content_type = input_data.content_type.chomp
		self.img_binary = input_data.read
	end

end
