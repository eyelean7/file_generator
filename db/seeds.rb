# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Job.destroy_all
Project.destroy_all
Client.destroy_all
clients = Client.create([{ name: 'Joe Shmoe', phone: '(708)123-1234', billing_address: '775 Orchard Road, Mokena, IL'}])
projects = Project.create([{ address: '1422 Lilo Lane, Mokena, IL', description: 'addition on west side', client_id: clients.last.id }])
jobs = Job.create([{ description: 'initial inspection', hours: 4, rate: 85.00, project_id: projects.last.id }, { description: 'create blueprints options 1 and 2', hours: 14, rate: 100.00, project_id: projects.last.id }])
