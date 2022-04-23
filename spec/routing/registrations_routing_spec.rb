require 'rails_helper'

RSpec.describe Api::Auth::RegistrationsController, type: :routing do
  describe 'ログイン周り' do
    it 'routes to #new' do
      expect(get: '/api/auth/sign_up').to route_to('api/auth/registrations#new')
    end
    it 'routes to #create' do
      expect(post: '/api/auth').to route_to('api/auth/registrations#create')
    end
    it 'routes to #edit' do
      expect(get: '/api/auth/edit').to route_to('api/auth/registrations#edit')
    end
    it 'routes to #update' do
      expect(put: '/api/auth').to route_to('api/auth/registrations#update')
      expect(patch: '/api/auth').to route_to('api/auth/registrations#update')
    end
    it 'routes to #destroy' do
      expect(delete: '/api/auth').to route_to('api/auth/registrations#destroy')
    end
  end
end