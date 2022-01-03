class MysqlSkillDeleter
  attr_accessor :mysql_skill, :mysql_skill_params
  delegate :call, to: :new

  def initialize(args)
    @mysql_skill = args[:mysql_skill]
    @mysql_skill_paramsl = args[:params]
  end

  def call
    mysql_skill.update(deleted: true) ? { deleted: true, response: mysql_skill }
                                      : { deleted: false, response: nil, errors: mysql_skill.errors }
  end
end