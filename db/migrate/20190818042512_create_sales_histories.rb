class CreateSalesHistories < ActiveRecord::Migration[5.2]
	def change
		create_table :sales_histories do |t|
			t.integer :shipping_address_id
			t.integer :total
			t.integer :status, default: 0, null: false, limit: 1
			t.timestamps
		end
	end
end
