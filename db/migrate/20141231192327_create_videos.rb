class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :link
    end
  end
end
