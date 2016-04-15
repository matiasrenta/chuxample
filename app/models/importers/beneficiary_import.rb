
class BeneficiaryImport < BaseImport
  def create_entity_from_row(row)
    beneficiary = Beneficiary.new
    beneficiary.apellido_paterno = row[I18n.translate('simple_form.labels.defaults.apellido_paterno')]
    beneficiary.apellido_materno = row[I18n.translate('simple_form.labels.defaults.apellido_materno')]
    beneficiary.nombres = row[I18n.translate('simple_form.labels.defaults.nombres')]
    beneficiary.sexo = row[I18n.translate('simple_form.labels.defaults.sexo')]
    beneficiary.edad = row[I18n.translate('simple_form.labels.defaults.edad')]
    beneficiary.fecha_nacimiento = row[I18n.translate('simple_form.labels.defaults.fecha_nacimiento')]
    beneficiary.lugar_nacimiento = row[I18n.translate('simple_form.labels.defaults.lugar_nacimiento')]
    beneficiary.pertenencia_etnica = row[I18n.translate('simple_form.labels.defaults.pertenencia_etnica')]
    beneficiary.grado_maximo_estudios = row[I18n.translate('simple_form.labels.defaults.grado_maximo_estudios')]
    beneficiary.anios_residencia_en_df = row[I18n.translate('simple_form.labels.defaults.anios_residencia_en_df')]
    beneficiary.domicilio = row[I18n.translate('simple_form.labels.defaults.domicilio')]
    beneficiary.ocupacion = row[I18n.translate('simple_form.labels.defaults.ocupacion')]
    beneficiary.nombre_padre = row[I18n.translate('simple_form.labels.defaults.nombre_padre')]
    beneficiary.nombre_madre = row[I18n.translate('simple_form.labels.defaults.nombre_madre')]
    beneficiary.curp = row[I18n.translate('simple_form.labels.defaults.curp')]
    beneficiary.territorial_unit_id = TerritorialUnit.find_by_id(row[I18n.translate('simple_form.labels.defaults.territorial_unit')]).id
    beneficiary
  end
end
