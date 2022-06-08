users = User.create!(
  [
    { name: "Alex", email: "myemail0@mail.ru", password: 123456, password_confirmation: 123456},
    { name: "Bob", email: "myemail1@mail.ru", password: 123456, password_confirmation: 123456 }
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
    { title: "Javascript", level: 2, category: categories[1], author: users.first },
    { title: "CSS/SCSS", level: 1, category: categories[1], author: users.last }
  ]
)

questions = Question.create!(
  [
    { body: "How much gems you know?", test: tests[0] },
    { body: "How set the color of text?", test: tests[3] },
    { body: "Who is DHH?", test: tests[1] },
    { body: "Question1?", test: tests[1] },
    { body: "Question2?", test: tests[1] },
    { body: "Question3?", test: tests[1] }
  ]
)

answers = Answer.create!(
  [
    { body: "Color of text set by text-color property", question: questions[1], correct: true },
    { body: "Answer 1", question: questions[0], correct: true },
    { body: "Answer 2", question: questions[2], correct: true },
    { body: "Answer 3", question: questions[0], correct: true },
    { body: "Answer 4", question: questions[2], correct: true }
  ]
)
