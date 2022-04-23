module Ec2Skills
  class MyselfEc2SkillsQuery < Query
    def initialize(relation = Ec2Skill.all)
      @relation = relation
    end

    def call
      @relation.eager_load(:me).
                where(ec2_skills: {deleted: false}).
                where(mes: {id: Rails.application.credentials.me})
    end
  end
end