class PostSerializer < ActiveModel::Serializer
  attributes :user, :id, :title, :content, :updated_at, :category, :comments
end
