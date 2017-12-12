class CreateEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :emails do |t|
      t.integer :sender_id, foreign_key: true
      t.integer :recipient_id, foreign_key: true
      t.string :subject
      t.text :body
      t.string :status

      t.timestamps
    end
  end
end
