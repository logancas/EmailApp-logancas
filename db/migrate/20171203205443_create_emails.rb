class CreateEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :emails do |t|
      t.references :sender, foreign_key: true
      t.references :recipient, foreign_key: true
      t.string :subject
      t.text :body
      t.string :status

      t.timestamps
    end
  end
end
