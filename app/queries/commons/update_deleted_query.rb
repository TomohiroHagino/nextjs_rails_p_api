module Commons
  class UpdateDeletedQuery < Query
    def initialize(args)
      @boolean = args[:boolean]
      @relation = Module.const_get(args[:class_name])
    end

    def call
      @relation.update(deleted: boolean)
    end
  end
end