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
        show: record.decorate.link_to_show,
        edit: record.decorate.link_to_edit,
        remove: record.decorate.link_to_remove,
        DT_RowId:   record.id,
      }
    end
  end

  def get_raw_records
    AttendanceList.includes(:type).references(:type).all
  end

end

class AttendanceListDecorator < ApplicationDecorator
  def link_to_show
    h.link_to 'Mostrar', h.attendance_list_path(object), class: 'text-primary btn-sm'
  end

  def link_to_edit
    h.link_to 'Editar', h.edit_attendance_list_path(object), class: 'text-primary btn-sm'
  end

  def link_to_remove
    h.link_to 'Excluir', h.attendance_list_path(object), method: :delete, data: { confirm: 'Are you sure?' }, class:"text-danger btn-sm"
  end
end