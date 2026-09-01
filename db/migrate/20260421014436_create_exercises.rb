class CreateExercises < ActiveRecord::Migration[8.0]
  def change
    create_table :exercises do |t|
      t.integer :reps
      t.string :type
      t.string :self_report
      t.integer :intensity
      t.string :name
      t.integer :duration_seconds
      t.boolean :completed, default: false
      t.boolean :skipped, default: false
      t.boolean :show_timer, default: false
      t.integer :default_timer_interval_seconds
      t.boolean :show_metronome, default: false
      t.integer :bpm
      t.references :workout, null: false, foreign_key: true

      t.timestamps
    end
  end
end
