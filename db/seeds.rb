
Question.delete_all


20.times do
  question = Question.create!(
               title: Faker::Company.name,
               content: Faker::Company.name,
               author_id: rand(10),
               )
end

