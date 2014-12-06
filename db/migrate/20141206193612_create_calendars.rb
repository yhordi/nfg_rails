class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.string :summary
      t.string :time
      t.string :description
      t.string :location
      t.string :maplink
    end
  end
end
