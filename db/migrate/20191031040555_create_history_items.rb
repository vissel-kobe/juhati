class CreateHistoryItems < ActiveRecord::Migration[5.2]
	def change
		create_table :history_items do |t|
			t.integer :sales_history_id
			t.integer :album_id
			t.string :album_title
			t.integer :album_price
			t.integer :quantity
			t.timestamps
		end
	end
end
