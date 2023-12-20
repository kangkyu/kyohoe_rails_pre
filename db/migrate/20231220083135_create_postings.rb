class CreatePostings < ActiveRecord::Migration[7.1]
  def change
    create_table :postings do |t|
      t.string :title
      t.string :video_url
      t.text :content

      t.timestamps
    end
  end
end
