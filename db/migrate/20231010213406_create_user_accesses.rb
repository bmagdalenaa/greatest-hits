class CreateUserAccesses < ActiveRecord::Migration[7.0]
  def change
    create_table :user_accesses do |t|
      t.string :access_type

      t.timestamps
    end
  end
end
