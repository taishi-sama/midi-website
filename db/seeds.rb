# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
if Rails.env.development?
  u1 = User.create(login: 'test1', email: 'test1@e.com', password: '123', password_confirmation: '123')
  u2 = User.create(login: 'test2', email: 'test2@example.com', password: '123', password_confirmation: '123')
  
  (1..40).each do
    u1.midi_files.create(song_name: Faker::Music.album, author: Faker::Music.band, public: true)
  end
end

