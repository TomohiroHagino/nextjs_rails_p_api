module Ec2Skills
  class MyselfEc2SkillsQuery < Query
    def initialize(relation = Ec2Skill.all)
      @relation = relation
    end

    # 今回の固定値1は許容しました。
    def call
      @relation.eager_load(:me).
                where(ec2_skills: {deleted: false}).
                where(mes: {id: 1})
    end
  end
end