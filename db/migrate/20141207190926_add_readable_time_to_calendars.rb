class AddReadableTimeToCalendars < ActiveRecord::Migration
  def change
    add_column :calendars, :readable_time, :string
  end
end
