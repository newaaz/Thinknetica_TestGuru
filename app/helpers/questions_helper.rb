module QuestionsHelper
  def question_header(question)
    if question.new_record?
      t('admin.questions.new', test: question.test.title)
    else
      t('admin.questions.edit', test: question.test.title)
    end
  end
end
