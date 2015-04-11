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

require 'test_helper'

class EmojiTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
