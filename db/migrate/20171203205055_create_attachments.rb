class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.references :email, foreign_key: true
      t.attachment :file

      t.timestamps
    end
  end
end
