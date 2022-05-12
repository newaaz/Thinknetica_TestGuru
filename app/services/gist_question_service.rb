class GistQuestionService
  Struct.new('Result', :url) do
    def success?
      url.present?
    end
  end

  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    result = @client.create_gist(gist_params)
    Struct::Result.new result.html_url
  end

  def destroy_gist(gist)
    gist_id = (URI gist.url).path.split('/')[1]
    @client.delete_gist(gist_id)
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV.fetch('GITHUB_TOKEN'))
  end

  def gist_params
    {
      description: I18n.t('gist_question_service.description', title: @test.title),
      public: true,
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
