users = User.create!(
  [
    { name: "Alex",email: "myemail0@mail.ru" },
    { name: "Bob", email: "myemail1@mail.ru" }
  ]
)

categories = Category.create!(
  [
    { title: "Backend" },
    { title: "Frontend" },
    { title: "Mobile Development" },
    { title: "Machine Learning" }
  ]
)

tests = Test.create!(
  [
    { title: "Ruby Language", level: 3, category_id: categories[0].id, author_id: users.first.id },
    { title: "Rails Framework", level: 3, category_id: categories[0].id, author_id: users.first.id },
    { title: "Javascript", level: 2, category_id: categories[1].id, author_id: users.second.id },
    { title: "CSS/SCSS", level: 1, category_id: categories[1].id, author_id: users.last.id }
  ]
)

questions = Question.create!(
  [
    { body: "How much gems you know?", test_id: tests[0].id },
    { body: "How set the color of text?", test_id: tests[3].id },
    { body: "Who is DHH?", test_id: tests[1].id }
  ]
)

questions.each { |question| question.answers.create! body: "I don't know"}

answers = Answer.create!(
  [
    { body: "Color of text set by text-color property", question_id: questions[1].id, correct: true }
  ]
)

users.each do |user|
  tests.each do |test|
    test.results.create! user_id: user.id
  end
end
