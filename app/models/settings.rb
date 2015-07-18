class Settings < RailsSettings::CachedSettings
  defaults[:company_name] = "Company name"
  defaults[:head_name] = "Head name"
  defaults[:manager_premium] = 19
  defaults[:show_contract_fields] = true
  defaults[:launch_mode] = [:auto, :manual]
end
