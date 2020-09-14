class CreateDtasks < ActiveRecord::Migration[6.0]
  def change
    create_table :dtasks do |t|
      t.string :title
      t.string :content
      t.date :due_date

      t.timestamps
    end
  end
end
