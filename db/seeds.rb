# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
# 1.times do
#   User.create!([{ email: "admin@domain.com", password: "123456", password_confirmation: "123456" }])
# end

1000.times.each do |id|
    Agsk.create!(
        user_id: User.first.id,
        requirement: Faker::Lorem.sentence(word_count: 10),
        concept: Faker::Sports::Football.player,
        descriptor: Faker::Sports::Football.coach,
        filter: rand(0..59)
    )
end