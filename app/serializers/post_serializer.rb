class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  attribute :image_urls
  attribute :avatar_url

  def image_urls
    urls = []
    object.images.each do |image|
      ActiveStorage::Current.host = "yourhostname"
      direct_url = ActiveStorage::Blob.service.url(
        image.blob.key,
        expires_in: 20000,
        disposition: "attachment",
        filename: image.blob.filename,
        content_type: image.blob.content_type
      )
      urls << direct_url
    end
    urls
  end

  def avatar_url
  	return nil if object.avatar.attachment.nil?
    ActiveStorage::Current.host = "yourhostname"
    ActiveStorage::Blob.service.url(
      object.avatar.blob.key,
      expires_in: 20000,
      disposition: "attachment",
      filename: object.avatar.blob.filename,
      content_type: object.avatar.blob.content_type
    )
  end
end
