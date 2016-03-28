class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.binary :data
      t.text :filename
      t.text :extension
      t.text :mime_type
      t.text :title
      t.text :description

      t.timestamps null: false
    end
  end
end
