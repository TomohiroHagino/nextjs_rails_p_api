class MysqlSkillCreator
  attr_accessor :klass, :mysql_skill_params
  delegate :call, to: :new

  def initialize(args)
    @klass = Module.const_get("MysqlSkill")
    @mysql_skill_params = args[:params]
  end

  def call
    resource = klass.new(mysql_skill_params)
    resource.save ? { created: true, response: resource, errors: {} }
                  : { created: false, response: {}, errors: resource.errors }
  end
end