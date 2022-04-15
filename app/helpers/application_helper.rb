module ApplicationHelper
  def current_year
    Time.new.year
  end

  def github_url(author, repo)
    url = "https://github.com/#{author}/#{repo}"
    link_to repo, url, target: "_blank", rel: "nofollow", class: "nav-link px-2"
  end
end
