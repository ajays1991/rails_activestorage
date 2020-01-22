class StorySerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  attribute :image_url

  def image_url
  	#https://github.com/rails/rails/issues/33549
  	#polymorphic_url(object.image)
  	#Rails.application.routes.url_helpers.rails_blob_path(object.image, disposition: "attachment", host: "http://localhost:3000")
  	ActiveStorage::Current.host = "yourhostname"
	direct_url = ActiveStorage::Blob.service.url(
	    object.image.blob.key,
	    expires_in: 20000,
	    disposition: "attachment",
	    filename: object.image.blob.filename,
	    content_type: object.image.blob.content_type
	)
	direct_url
  end
end
