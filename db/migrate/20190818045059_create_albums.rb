class CreateAlbums < ActiveRecord::Migration[5.2]
	def change
		create_table :albums do |t|
			t.integer :label_id
			t.integer :genre_id
			t.string :title
			t.integer :status, default: 0, null: false, limit: 1
			t.text :album_image_id
			t.integer :price
			t.integer :stock
			t.string :deleted
			t.timestamps
		end
	end
end
