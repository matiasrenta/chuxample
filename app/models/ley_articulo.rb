class LeyArticulo < ActiveRecord::Base
  has_many :ley_fraccions, dependent: :restrict_with_error
  attachment :file, extension: %w[pdf xlx xlsx], store: 's3_ley_backend', cache: 's3_ley_cache'
  validates :codigo, :name, :descripcion_de_documento, :periodo_actualizacion, :detalle, presence: true

  before_save :set_actualizado
  after_destroy :remove_file_attached

  private

  def remove_file_attached
    file.try(:delete)
  end

  def set_actualizado
    if file_id_changed? && file_id_was != file_id # file_id_changed? no funciona como los atributos normales de rails, aunque no cambie dice que ha cambiado, por eso pregunto otra vez
      self.actualizado = Date.today
      self.validado = nil
    end
  end
end
