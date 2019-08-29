class CreateReviews < ActiveRecord::Migration[5.2]
	def change
		create_table :reviews do |t|
			t.integer :user_id
			t.integer :album_id
			t.text :body
			t.timestamps
		end
	end
end
