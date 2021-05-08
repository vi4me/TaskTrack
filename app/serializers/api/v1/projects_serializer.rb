class Api::V1::ProjectsSerializer < ActiveModel::Serializer

  attributes :id, :title, :complexity, :created_at

end
