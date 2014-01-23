class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references  :client, index: true
      t.references  :vehicle, index: true
      t.references  :user, index: true
      t.text        :description
      t.integer     :status
      t.datetime    :timeStart
      t.datetime    :timeFinish

      t.timestamps
    end
  end
end
