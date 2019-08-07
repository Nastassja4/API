class CreateAffirmations < ActiveRecord::Migration[5.2]
  def change
    create_table :affirmations do |t|
      t.text :note
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
