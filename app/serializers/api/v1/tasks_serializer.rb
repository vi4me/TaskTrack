class Api::V1::TasksSerializer < ActiveModel::Serializer

  attributes :id, :title, :description, :deadline_date, :user_id, :project_id

end
