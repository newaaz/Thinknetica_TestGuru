
User.create([{ name: "Alex",email: "myemail0@mail.ru" },
             { name: "Bob", email: "myemail1@mail.ru" }
            ])

Category.create([{ title: "Backend" },
                 { title: "Frontend" },
                 { title: "Mobile Development" },
                 { title: "Machine Learning" }
                ])

Test.create([{ title: "Ruby Language", level: 3, category_id: Category.first.id, author_id: User.first.id },
             { title: "Rails Framework", level: 3, category_id: Category.first.id, author_id: User.first.id },
             { title: "Javascript", level: 2, category_id: Category.find_by(title: "Frontend").id, author_id: User.first.id },
             { title: "CSS/SCSS", level: 1, category_id: Category.find_by(title: "Frontend").id, author_id: User.first.id }
            ])

Question.create([{ body: "How much gems you know?", test_id: Test.find_by(title: "Ruby Language").id },
                 { body: "How set the color of text?", test_id: Test.find_by(title: "CSS/SCSS").id },
                 { body: "Who is DHH?", test_id: Test.find_by(title: "Rails Framework").id }
                ])
# Создаём ответ "Я не знаю" для всех вопросов
Question.pluck(:id).each { |id| Answer.create body: "I don't know", question_id: id }
Answer.create([{ body: "Color of text set by text-color property",
                 question_id: Question.find_by(body: "How set the color of text?").id,
                 correct: true }
                ])

Result.create([{ user_id: User.first.id, test_id: Test.first.id },
               { user_id: User.first.id, test_id: Test.second.id },
               { user_id: User.first.id, test_id: Test.last.id }    
              ])


