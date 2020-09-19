class AddTaskIdToDtasks < ActiveRecord::Migration[6.0]
  def change
    add_reference :dtasks, :task, foreign_key: true
  end
end
