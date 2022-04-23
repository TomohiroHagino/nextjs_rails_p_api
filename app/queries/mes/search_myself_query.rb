module Mes
  class SearchMyselfQuery < Query
    # 自分のデータを確実に見てもらいたいので固定値1は許容。
    def initialize(relation = Me.find(1))
      @relation = relation
    end

    def call
      @relation
    end
  end
end