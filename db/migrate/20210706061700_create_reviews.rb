class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text       :text         , null: false
      t.integer    :achievement_id     , null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
