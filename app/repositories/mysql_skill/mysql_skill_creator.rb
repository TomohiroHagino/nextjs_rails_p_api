class MysqlSkillCreator
  attr_accessor :mysql_skills
  delegate :call, to: :new

  def initialize(args)
    @klass = Module.const_get("MysqlSkill")
    @mysql_skill_params = args[:params]
  end

  def call
    resource = klass.new(mysql_skill_params)
    resource.create ? { created: true, response: resource, errors: {} }
                    : { created: false, response: {}, errors: resource.errors }
  end
end