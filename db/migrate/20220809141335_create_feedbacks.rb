class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.string :description
      t.integer :counsellar_id
      t.integer :customer_id
      t.timestamps
    end
  end
end
