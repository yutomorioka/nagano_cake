class CreateAdminns < ActiveRecord::Migration[6.1]
  def change
    create_table :adminns do |t|

      t.timestamps
    end
  end
end
