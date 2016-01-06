class CreateApiResponses < ActiveRecord::Migration
  def change
    create_table :api_responses do |t|
      t.string :name
      t.text :body
      t.timestamps
    end
  end
end
