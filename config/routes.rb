Rails.application.routes.draw do
  post 'api/test/UpdateUserLocation', to: 'api/test#UpdateUserLocation'
  get 'api/test/getJourneyTrack', to: 'api/test#getJourneyTrack'
  get "up" => "rails/health#show", as: :rails_health_check
  get 'api/test/deleteLocationData', to: 'api/test#deleteLocationData'
end