module Commons
  class SearchMyselfSkillsQuery > Query
    def initialize(args)
      @boolean = args.fetch(:boolean) || false
      @relation = Module.const_get(args[:class_name])
    end

    # ポートフォリオなので固定値1は許容しました。
    def call
      @relation.eager_load(:me).
                where(mes: {id: 1})
                # where(deleted: false)
    end
  end
end