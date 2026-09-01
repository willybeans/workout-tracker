class CreateWorkouts < ActiveRecord::Migration[8.0]
  def change
    create_table :workouts do |t|
      t.string :name
      t.text :description
      t.datetime :time
      t.string :type
      t.integer :duration_seconds

      t.timestamps
    end
  end
end
