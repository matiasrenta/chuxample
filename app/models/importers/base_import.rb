class BaseImport
  include ActiveModel::Model
  attr_accessor :file, :quantity_records, :save_in_ddbb
  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  def save
    if imported_entities.map(&:valid?).all?
      if save_in_ddbb == '1'
        Thing.import imported_entities # esto es del gem activerecord-import el cual hace una sola sentencia insert para todos los registros. Cuidado: no validations y no callbacks
        #Thing.transaction do
        #  imported_entities.each(&:save!)
        #end
      end
      true
    else
      errors.add(:base, I18n.translate('activerecord.errors.messages.invalid_imported_entities'))
      imported_entities.each_with_index do |action, index|
        action.errors.full_messages.each do |message|
          errors.add :base, "Fila #{index+2}: #{message}"
        end
      end
      false
    end
  end

  def imported_entities
    @imported_entities ||= load_imported_entities
  end

  def load_imported_entities
    entities = Array.new
    spreadsheet = open_spreadsheet
    header_aux = spreadsheet.row(1)
    header = Array.new
    header_aux.each {|e| header << e.strip}

    secuencia = 2..spreadsheet.last_row if quantity_records == 'todos'
    secuencia = 2..3 if quantity_records == 'un_par'

    (secuencia).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      entities << create_entity_from_row(row)
    end
    entities
  end

  def open_spreadsheet
    case File.extname(file.original_filename)
      when ".xlsx" then Roo::Spreadsheet.open(file.path, extension: :xlsx)
      when ".xls" then Roo::Spreadsheet.open(file.path, extension: :xls)
      else raise "Tipo de archivo desconocido: #{file.original_filename}. (tipos aceptados: .xls, .xlsx)"
    end
  end
end