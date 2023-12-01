class CreateTicket < ActiveRecord::Migration[7.1]
  def change
    create_table :tickets do |t|
      t.string :name
      t.integer :price
      t.string :description

      t.timestamps

      
    end

  end
end
