module Mes
  class SearchMyselfQuery > Query
    def initialize(relation = Me.find(1)) # ポートフォリオなので固定値いれました。
      @relation = relation
    end

    def call
      @relation
    end
  end
end