class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :updated_at, :user
end
