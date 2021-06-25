class CreateEmailLabels < ActiveRecord::Migration[6.0]
  def change
    create_table :email_labels do |t|
      t.integer :contact_id
      t.integer :email_id

      t.timestamps
    end
  end
end
