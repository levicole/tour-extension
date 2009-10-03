class AddMoreOptionsForTourDate < ActiveRecord::Migration
  def self.up
    add_column :tour_dates, :approved, :boolean, :default => true
    add_column :tour_dates, :venue, :string
    add_column :tour_dates, :description, :text
    add_column :tour_dates, :tickets_link, :string
  end

  def self.down
    remove_column :tour_dates, :approved
    remove_column :tour_dates, :venue
    remove_column :tour_dates, :description
    remove_column :tour_dates, :tickets_link
  end
end
