module MysqlSkills
  class MyselfMysqlSkillsQuery < Query
    def initialize(relation = MysqlSkill.all)
      @relation = relation
    end

    # 自分のデータを確実に見てもらいたいので固定値1は許容。
    def call
      @relation.eager_load(:me).
                where(mysql_skills: {deleted: false}).
                where(mes: {id: Rails.application.credentials.me})
    end
  end
end