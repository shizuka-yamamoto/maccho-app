class CreateTargets < ActiveRecord::Migration[6.0]
  def change
    create_table :targets do |t|
      t.text :content, null: false
      t.datetime :start_time
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
