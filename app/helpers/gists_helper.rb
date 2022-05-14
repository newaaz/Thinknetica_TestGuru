module GistsHelper
  def short_question(question)
    truncate question.body, length: 25
  end

  def link_to_gist(gist)
    link_to (URI gist.url).path, gist.url, target: "_blank", rel: "nofollow noopener"
  end

  def link_to_created_gist(url)
    link_to t('gists.create.link_to_gist'), url, class: "alert-link", target: "_blank", rel: "nofollow noopener"
  end
end
