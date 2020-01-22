class StoryController < ApplicationController
  def create
  	story = Story.create!(story_params)
  	render json: {
  		story: ActiveModelSerializers::SerializableResource.new(@story, {})
  	}
  end

  def show
  	@story = Story.find(params[:id])
  	respond_to do |format|
  		format.html
  		format.json { render json: { story: ActiveModelSerializers::SerializableResource.new(@story, {}) } }
  	end
  end

  private

  def story_params
    params.require(:story).permit(:title, :description, :image)
  end
end
