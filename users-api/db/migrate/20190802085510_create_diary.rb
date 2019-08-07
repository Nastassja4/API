class CreateDiary < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.string :title
      t.text :entry
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
