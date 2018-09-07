# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#categories
puts "Seeding..."
Type.create! [
    {name: "Processo Trainee"},
    {name: "REGER"}
  ]

User.create(nome: "Jorge", email: "jorge@email.com", membro: "true")
User.create(nome: "Paulo", email: "paulo@email.com", membro: "true")
User.create(nome: "maria", email: "maria@email.com", membro: "false")


AttendanceList.create(description: "REGER 1", type_id: "2");
AttendanceList.create(description: "REGER 2", type_id: "2");
AttendanceList.create(description: "Primeira aula do PT", type_id: "1");


puts "Seeding... OK"