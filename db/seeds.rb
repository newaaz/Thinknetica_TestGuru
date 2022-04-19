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
    { title: "Ruby Language", level: 3, category: categories[0], author: users.first },
    { title: "Rails Framework", level: 3, category: categories[0], author: users.first },
    { title: "Javascript", level: 2, category: categories[1], author: users.second },
    { title: "CSS/SCSS", level: 1, category: categories[1], author: users.last }
  ]
)

questions = Question.create!(
  [
    { body: "How much gems you know?", test: tests[0] },
    { body: "How set the color of text?", test: tests[3] },
    { body: "Who is DHH?", test: tests[1] }
  ]
)

questions.each { |question| question.answers.create! body: "I don't know"}

answers = Answer.create!(
  [
    { body: "Color of text set by text-color property", question: questions[1], correct: true }
  ]
)

Result.create!(
  [
    { user: users[0], test: tests[0], current_question: questions[0] },
    { user: users[0], test: tests[1], current_question: questions[0] },
    { user: users[0], test: tests[2], current_question: questions[0] },
    { user: users[0], test: tests[3], current_question: questions[0] },
    { user: users[1], test: tests[0], current_question: questions[0] },
    { user: users[1], test: tests[1], current_question: questions[0] },
    { user: users[1], test: tests[2], current_question: questions[0] },
    { user: users[1], test: tests[3], current_question: questions[0] },
  ]
)
