# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

s = Situation.new
s.description = "Tu es sur la plage"
s.choice_a = "Marcher le long de l´eau"
s.choice_b = "Aller dans la jungle"
s.choice_a_id = s.id + 1
# s.choice_b_id =
