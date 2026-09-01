class CreateWorkoutSchedules < ActiveRecord::Migration[8.0]
  def change
    create_table :workout_schedules do |t|
      t.string :name
      t.string :type
      t.text :description

      t.timestamps
    end
  end
end
