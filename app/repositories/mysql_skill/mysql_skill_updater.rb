class MysqlSkillUpdater
  attr_accessor :mysql_skill, :mysql_skill_params

  def initialize(args)
    @mysql_skill = args[:mysql_skill]
    @mysql_skill_params = args[:mysql_skill_params]
  end

  def call
    mysql_skill.update(mysql_skill_params) ? { updated: true, response: mysql_skill }
                                           : { updated: false, response: nil, errors: mysql_skill.errors }
  end
end