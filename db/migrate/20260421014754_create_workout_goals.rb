class CreateWorkoutGoals < ActiveRecord::Migration[8.0]
  def change
    create_table :workout_goals do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :title
      t.text :intention
      t.boolean :started
      t.boolean :ended

      t.timestamps
    end
  end
end
