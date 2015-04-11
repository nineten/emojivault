class CreateEmojis < ActiveRecord::Migration
  def change
    create_table :emojis do |t|
			t.string :name, null: false
			t.binary :img, :limit => 500.kilobytes

      t.timestamps null: false
    end
  end
end
