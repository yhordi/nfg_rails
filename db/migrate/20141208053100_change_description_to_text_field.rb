class ChangeDescriptionToTextField < ActiveRecord::Migration
  def change
    change_column :calendars, :description, :text
  end
end
