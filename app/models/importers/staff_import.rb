
class StaffImport < BaseImport
  def create_entity_from_row(row)
    staff = Staff.new
    staff.apellido_paterno       = row[I18n.translate('simple_form.labels.defaults.apellido_paterno')]
    staff.apellido_materno       = row[I18n.translate('simple_form.labels.defaults.apellido_materno')]
    staff.nombres                = row[I18n.translate('simple_form.labels.defaults.nombres')]
    staff.sexo                   = row[I18n.translate('simple_form.labels.defaults.sexo')]
    staff.fecha_nacimiento       = row[I18n.translate('simple_form.labels.defaults.fecha_nacimiento')]
    staff.indefinido             = row[I18n.translate('simple_form.labels.defaults.indefinido')]
    staff.periodo_desde          = row[I18n.translate('simple_form.labels.defaults.periodo_desde')]
    staff.periodo_hasta          = row[I18n.translate('simple_form.labels.defaults.periodo_hasta')]
    staff.anios_residencia_en_df = row[I18n.translate('simple_form.labels.defaults.anios_residencia_en_df')]
    staff.domicilio              = row[I18n.translate('simple_form.labels.defaults.domicilio')]
    staff.ocupacion              = row[I18n.translate('simple_form.labels.defaults.ocupacion')]
    staff.nombre_padre           = row[I18n.translate('simple_form.labels.defaults.nombre_padre')]
    staff.nombre_madre           = row[I18n.translate('simple_form.labels.defaults.nombre_madre')]
    staff.curp                   = row[I18n.translate('simple_form.labels.defaults.curp')]
    staff.importe_actual         = row[I18n.translate('simple_form.labels.defaults.importe_actual')]
    staff.job_title_id           = JobTitle.find_by_name(row[I18n.translate('simple_form.labels.defaults.job_title')]).id
    staff.ascription_id          = Ascription.find_by_name(row[I18n.translate('simple_form.labels.defaults.ascription')]).id
    staff
  end
end
