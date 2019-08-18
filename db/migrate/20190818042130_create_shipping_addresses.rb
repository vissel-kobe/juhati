class CreateShippingAddresses < ActiveRecord::Migration[5.2]
	def change
		create_table :shipping_addresses do |t|
			t.integer :user_id
			t.string :postcode
			t.string :address
			t.timestamps
		end
	end
end
