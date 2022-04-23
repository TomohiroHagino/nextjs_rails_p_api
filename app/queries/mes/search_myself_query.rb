module Mes
  class SearchMyselfQuery < Query
    def initialize(relation = Me.find(Rails.application.credentials.me))
      @relation = relation
    end

    def call
      @relation
    end
  end
end