# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
# 1.times do
#   User.create!([{ email: "admin@domain.com", password: "123456", password_confirmation: "123456" }])
# end

1.times.each { |id| User.create!(email: id.to_s + "first@domain.com", password: "123456", password_confirmation: "123456") }
1.times.each { |id| User.create!(email: id.to_s + "second@domain.com", password: "123456", password_confirmation: "123456") }


500.times.each do |id|
    Agsk.create!(
        user_id: rand(1..2),
        requirement: Faker::Sports::Football.team + rand(500..1000).to_s,
        concept: Faker::Sports::Football.player,
        descriptor: Faker::Sports::Football.coach,
        formalizability: rand(0..2)
    )
end