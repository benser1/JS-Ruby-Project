class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :updated_at, :user, :category, :category_id, :comments
end
