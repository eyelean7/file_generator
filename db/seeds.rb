# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Client.destroy_all
clients = Client.create([{ name: 'Joe Shmoe', phone: '(708)123-1234', billing_address: '123 Fake Ave, Mokena, IL'}, { name: 'Me Myself', phone: '(708)567-5678', billing_address: '456 Unreal Street, Chicago, IL'}])
