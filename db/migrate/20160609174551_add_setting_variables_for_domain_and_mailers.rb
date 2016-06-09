class AddSettingVariablesForDomainAndMailers < ActiveRecord::Migration
  def change
    Sett.create!(var: 'DOMAIN_OR_SUBDOMAIN', value: 'change_me', description: 'Ejemplo: deliriumtechmen.com ó chucky.ps.opi.la Se usa en los mailers, assets host, smtp_settings')
    Sett.create!(var: 'EXCEPTION_NOTIFICATION_EMAIL', value: 'change_me', description: 'Email al que se notificará cuando la aplicación falle (error 500)')
    Sett.create!(var: 'EXCEPTION_NOTIFICATION_EMAIL_PREFIX', value: 'change_me', description: 'Ejemplo: "chucky 500 - ". Prefijo que sale en el subject de los emails de excepciones')
    Sett.create!(var: 'ACTION_MAILER_FRIENDLY_FROM', value: 'change_me', description: 'Ejemplo: "Chucky". Es el frendly sender de mails que envía el sistema. Por lo general será el nombre de la aplicación.')
  end
end
