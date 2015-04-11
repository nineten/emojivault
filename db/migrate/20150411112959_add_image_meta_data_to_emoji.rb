class AddImageMetaDataToEmoji < ActiveRecord::Migration
  def change
		remove_column :emojis, :img
    add_column :emojis, :filename, :string
    add_column :emojis, :content_type, :string
    add_column :emojis, :img_binary, :binary, :limit => 500.kilobytes
  end
end
