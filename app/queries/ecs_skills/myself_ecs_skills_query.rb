module EcsSkills
  class MyselfEcsSkillsQuery < Query
    def initialize(relation = EcsSkill.all)
      @relation = relation
    end

    def call
      @relation.select('ecs_skills.id,ecs_skills.title,ecs_skills.body')
               .joins(:me)
               .where(ecs_skills: {deleted: false})
               .where(mes: {id: Rails.application.credentials.me})
    end
  end
end