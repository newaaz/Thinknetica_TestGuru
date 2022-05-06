module GistsHelper
  def short_question(question)
    truncate question.body, length: 25
  end

  def url_path(gist)
    (URI gist.url).path
  end
end
