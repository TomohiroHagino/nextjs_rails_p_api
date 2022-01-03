module MysqlSkills
  class MyselfMysqlSkillsQuery < Query
    def initialize(relation = MysqlSkill.all)
      @relation = relation
    end

    # 今回の固定値1は許容しました。
    def call
      @relation.eager_load(:me).
                where(mysql_skills: {deleted: false}).
                where(mes: {id: 1})
    end
  end
end