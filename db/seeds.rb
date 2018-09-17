# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#categories
puts "Seeding..."

Admin.create(email: "admin@email.com", password: "admin123", password_confirmation:"admin123");

Type.create(name: "Processo Trainee")
Type.create(name: "REGER")

User.create(nome: "Jorge", email: "jorge@email.com", membro: "true")
User.create(nome: "Paulo", email: "paulo@email.com", membro: "true")
User.create(nome: "maria", email: "maria@email.com", membro: "false")


AttendanceList.create(data:"10/10/10", description: "REGER 1", type_id: "2");
AttendanceList.find(1).status.create(user_id: "1", state: "Presente");
AttendanceList.find(1).status.create(user_id: "2", state: "Presente");


AttendanceList.create(data:"10/10/10", description: "REGER 2", type_id: "2");
AttendanceList.find(2).status.create(user_id: "1", state: "Ausente");
AttendanceList.find(2).status.create(user_id: "2", state: "Falta Justificada");


AttendanceList.create(data:"10/10/10", description: "Primeira aula do PT", type_id: "1");
AttendanceList.find(3).status.create(user_id: "3", state: "Falta");

puts "Seeding... OK"