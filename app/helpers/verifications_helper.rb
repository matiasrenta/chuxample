module VerificationsHelper
  def status_icon(status)
    case status
      when -1
        'Sin Revisar'
      when 1
        "<p style='font-size:20px;'><i class='fa-fw fa fa-check-circle' style='color:green;'></i></p>".html_safe
      when 0
        "<p style='font-size:20px;'><i class='fa-fw fa fa-times-circle' style='color:red;'></i></p>".html_safe
      else
        raise 'Verificación con status erroneo'
    end
  end

  def humanize_answer(answer)
    case answer
      when 1
        'Sí'
      when 0
        'No'
      else
        raise 'Valor de respuesta erroneo'
    end
  end

end
