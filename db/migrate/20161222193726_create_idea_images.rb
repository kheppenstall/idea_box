class CreateIdeaImages < ActiveRecord::Migration[5.0]
  def change
    create_table :idea_images do |t|
      t.references :image, foreign_key: true
      t.references :idea, foreign_key: true

      t.timestamps
    end
  end
end
