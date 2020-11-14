class CreateChapter1s < ActiveRecord::Migration[6.0]
  def change
    create_table :chapter1s do |t|
      t.integer :user_id
      t.integer :course_id
      t.integer :chapter_id
       t.integer :section_id
      t.timestamps
    end
    add_index :chapter1s, :user_id
  end
end
