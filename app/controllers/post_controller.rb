class PostController < ApplicationController
  def create
  	post = Post.create!(post_params)
  	render json: {
  		post: ActiveModelSerializers::SerializableResource.new(post, {})
  	}
  end

  def show
  	@post = Post.find(params[:id])
  	respond_to do |format|
  		format.html
  		format.json { render json: { post: ActiveModelSerializers::SerializableResource.new(@post, {}) } }
  	end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, images: [])
  end
end
