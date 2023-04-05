# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

rand(10..25).times do
  Project.create!(name: Faker::Lorem.word.capitalize)
  User.create!(name: Faker::Name.name)

  rand(5..10).times do
    Comment.create!(
      project: Project.all.sample,
      user: User.all.sample,
      text: Faker::Lorem.sentence
    )
  end
end
