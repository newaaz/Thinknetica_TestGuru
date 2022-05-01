module TestPassagesHelper
  def current_question(test_passage)
    "#{t('.question')} #{test_passage.number_current_question} / #{test_passage.test.questions.count}"
  end
end
