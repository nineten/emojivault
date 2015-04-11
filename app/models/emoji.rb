# == Schema Information
#
# Table name: emojis
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  img        :binary
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Emoji < ActiveRecord::Base
end
