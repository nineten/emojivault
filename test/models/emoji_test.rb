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

require 'test_helper'

class EmojiTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
