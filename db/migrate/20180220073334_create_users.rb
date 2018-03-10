class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.uuid :android_device_uuid

      t.timestamps
    end
  end
end
