class CreateWorkoutSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :workout_sessions do |t|
      t.date :date
      t.string :activity
      t.integer :duration
      t.text :description
      t.references :user, null: false, foreign_key: true  # Esta línea es crucial

      t.timestamps
    end
  end
end

