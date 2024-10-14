class CreateSessions < ActiveRecord::Migration[7.2]
  def change
    create_table :sessions do |t|
      t.integer :user_id
      t.string :key

      t.timestamps
    end
  end
end
