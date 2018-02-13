class ReviewlistSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :start, :end, :url, #:reviewable_type

  def title
    object.reviewable.title
  end

  def description
    ""
  end

  def start
    object.start_date
  end

  def end
    object.start_date + 3.hours
  end

  def url
    if object.reviewable_type == 'Post'
      "\/posts\/#{object.reviewable_id}"
    else
      "\/media"+"\/#{object.reviewable_id}"
    end
  end

  belongs_to :user, key: :owner
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :full_name
  end

  belongs_to :reviewable, polymorphic: true
  class PostSerializer < ActiveModel::Serializer
    attributes :id, :title
  end
  class MediumSerializer < ActiveModel::Serializer
    attributes :id, :title
  end

end
