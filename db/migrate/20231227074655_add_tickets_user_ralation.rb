class AddTicketsUserRalation < ActiveRecord::Migration[7.1]
  def change
    create_table :tickets_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :ticket
    end
  end
end
