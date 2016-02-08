class AddContentLengthToApiResponse < ActiveRecord::Migration
  def change
    add_column :api_responses, :content_length, :integer
  end
end
