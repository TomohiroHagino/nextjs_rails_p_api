module Commons
  # 現在未利用
  class SearchMyselfSkillsQuery > Query
    def initialize(args)
      @boolean = args.fetch(:boolean) || false
      @relation = Module.const_get(args[:class_name])
    end

    # 自分のデータを確実に見てもらいたいので固定値1は許容。
    def call
      @relation.eager_load(:me).
                where(mes: {id: 1})
                # where(deleted: false)
    end
  end
end