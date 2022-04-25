module Commons
  # 現在未利用
  class SearchMyselfSkillsQuery > Query
    def initialize(args)
      @boolean = args.fetch(:boolean) || false
      @relation = Module.const_get(args[:class_name])
    end

    def call
      @relation.find(id: Rails.application.credentials.me)
    end
  end
end