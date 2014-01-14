class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name

      t.boolean :canViewUsers
      t.boolean :canViewRoles
      t.boolean :canViewOrders
      t.boolean :canViewClients
      t.boolean :canViewVehicles
      t.boolean :canViewProcedures
      t.boolean :canViewSettings
      t.boolean :canViewParts
      t.boolean :canViewWorkingHours
      t.boolean :canViewStatements
      t.boolean :canViewNetworks
      t.boolean :canViewPages
      t.boolean :canViewCategories

      t.boolean :canChangeUsers
      t.boolean :canChangeRoles
      t.boolean :canChangeOrders
      t.boolean :canChangeClients
      t.boolean :canChangeVehicles
      t.boolean :canChangeProcedures
      t.boolean :canChangeSettings
      t.boolean :canChangeParts
      t.boolean :canChangeWorkingHours
      t.boolean :canChangeStatements
      t.boolean :canChangeNetworks
      t.boolean :canChangePages
      t.boolean :canChangeCategories

      t.boolean :isDeleteable

      t.timestamps
    end
  end
end
