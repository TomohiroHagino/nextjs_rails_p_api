module Ec2Skills
  class MyselfEc2SkillsQuery < Query
    def initialize(relation = Ec2Skill.all)
      @relation = relation
    end

    # 自分のデータを確実に見てもらいたいので固定値1は許容。
    def call
      @relation.eager_load(:me).
                where(ec2_skills: {deleted: false}).
                where(mes: {id: 1})
    end
  end
end