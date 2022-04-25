module Ec2Skills
  class MyselfEc2SkillsQuery < Query
    def initialize(relation = Ec2Skill.all)
      @relation = relation
    end

    def call
      @relation.select('ec2_skills.id,ec2_skills.title,ec2_skills.body')
               .joins(:me)
               .where(ec2_skills: {deleted: false})
               .where(mes: {id: Rails.application.credentials.me})
    end
  end
end