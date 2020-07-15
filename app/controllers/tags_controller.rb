class TagsController < ApplicationController
  add_flash_types :success

  def show
    @tag = Tag.find(params[:id])
  end

  def index
    @tags = Tag.all
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    redirect_to tags_path, success: 'Tag is deleted'
  end
end
