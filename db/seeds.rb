
Question.delete_all
User.delete_all

user = User.create!(username: "coryrmathis", email: "coryrmathis@gmail.com", password: "password")

20.times do
  question = Question.create!(
               title: Faker::Hacker.say_something_smart,
               content: Faker::Hacker.say_something_smart,
               author_id: user.id
               )
end

