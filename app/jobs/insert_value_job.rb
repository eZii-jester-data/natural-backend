class InsertValueJob < ApplicationJob
  queue_as :default

  def perform(row_value)
    db_manager = ::Natural::DatabaseManager.new
    db = db_manager.database(row_value.column.table.database.database_identifier)
    table = db.table(row_value.column.table.name)
    id = table.insert_value(row_value.column.name, row_value.value)
    row_value.row.update_attribute(:db_id, id)
  end
end
