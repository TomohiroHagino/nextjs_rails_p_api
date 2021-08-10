module Mes
  class SearchMyselfQuery < Query
    def initialize(relation = Me.find(1)) # 今回自身の情報を呼び出す固定値は許容しました。
      @relation = relation
    end

    def call
      @relation
    end
  end
end