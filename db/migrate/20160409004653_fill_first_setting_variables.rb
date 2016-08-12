class FillFirstSettingVariables < ActiveRecord::Migration
  def change
    Sett.create!(var: 'REFILE_USE_S3', value: 'false', description: 'para que use o no S3 (conveniente cuando aun en producción quiero que use la simulacion de S3). Cualquier cosa que no sea la palabra true, entonces será false')
    Sett.create!(var: 'DELAY_JOBS', value: 'false', description: 'if not true, los delay jobs se ejecutan real time, sino se encolan (tambien dependen del RAILS_ENV. ver initializer/delayed_job_config.rb)')
  end
end
