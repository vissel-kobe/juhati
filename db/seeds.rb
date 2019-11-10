# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Admin.create!(email:  "kanrisya@kanrisya",
#              password:  "kanrisya",
#              password_confirmation: "kanrisya"
#              )

User.create!(family_name: "kanri",
			 first_name: "kanri",
			 kana_family_name: "管理",
			 kana_first_name: "かんり",
			 postcode: "111-1111",
			 address: "aaa",
			 telephone: "1111111",
			 deleted: "",
			 email:  "kanrisya@kanrisya",
			 password:  "kanrisya",
			 password_confirmation: "kanrisya"
             )
