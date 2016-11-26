class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :content
      t.integer :author_id
      t.integer :commentable_id
      t.string :commentable_type

      t.timestamps
    end
  end
end
