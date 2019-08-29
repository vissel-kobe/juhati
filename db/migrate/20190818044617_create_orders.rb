class CreateOrders < ActiveRecord::Migration[5.2]
	def change
		create_table :orders do |t|
			t.integer :user_id
			t.integer :album_id
			t.integer :number, default: 1, null: false, limit: 1
			t.integer :subtotal
			t.integer :status, default: 0, null: false, limit: 1
			t.timestamps
		end
	end
end
