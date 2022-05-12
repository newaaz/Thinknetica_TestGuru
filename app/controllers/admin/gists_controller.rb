class Admin::GistsController < Admin::BaseController
  def index
    @gists = Gist.all.order(created_at: :desc)
  end

  def destroy
    gist = Gist.find params[:id]
    GistQuestionService.new(gist.question).destroy_gist(gist)
    gist.destroy
    redirect_to admin_gists_path
  end
end
