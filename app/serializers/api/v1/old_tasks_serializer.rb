class Api::V1::OldTasksSerializer < ActiveModel::Serializer

  attributes :old_tasks

  def old_tasks
    object.tasks.where("tasks.deadline_date < ?", Date.today - 1.day)
  end

end
