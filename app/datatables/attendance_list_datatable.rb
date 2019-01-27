class AttendanceListDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      data: { source: "AttendanceList.data" },
      type: { source: "Type.name" }
    }
  end

  def data
    records.map do |record|
      {
        data: record.data,
        type: record.type.name,
        DT_RowId:   record.id,
      }
    end
  end

  def get_raw_records
    AttendanceList.includes(:type).all
  end

end
