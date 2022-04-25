module RdsSkills
  class MyselfRdsSkillsQuery < Query
    def initialize(relation = RdsSkill.all)
      @relation = relation
    end

    def call
      @relation.select('rds_skills.id,rds_skills.title,rds_skills.body')
               .joins(:me)
               .where(rds_skills: {deleted: false})
               .where(mes: {id: Rails.application.credentials.me})
    end
  end
end