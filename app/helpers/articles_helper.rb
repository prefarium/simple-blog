module ArticlesHelper
  def params_for_new_article
    params.require(:article).permit(:title, :body)
  end
end
