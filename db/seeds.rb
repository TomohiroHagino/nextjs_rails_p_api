me_introduce = [
                      "ご覧いただき、ありがとうございます!\n",
                      "普段は、バックエンドを担当しています。\n",
                      "最近学習しているNext.jsと、普段使用しているRailsを使用してポートフォリオにしてみました。\n"
                    ].join(",").gsub(",","")

me_hash = {introduce: me_introduce}
Me.create(me_hash)


ruby_skill_title = "オブジェクト指向を読んで感じたこと。"
ruby_skill_body = [
                      "RailsSkillサンプル\n",
                      "サンプル\n",
                      "サンプル\n"
                    ].join(",").gsub(",","")

ruby_skill_hash = {title: ruby_skill_title, body: ruby_skill_body, me_id: 1}
RubySkill.create(ruby_skill_hash)


rails_skill_title = "オブジェクト指向をRailsにどう適用させるか。"
rails_skill_body = [
                      "RailsSkillサンプル\n",
                      "サンプル\n",
                      "サンプル\n"
                    ].join(",").gsub(",","")

rails_skill_hash = {title: rails_skill_title, body: rails_skill_body, me_id: 1}
RailsSkill.create(rails_skill_hash)

next_js_title = "ISR・SSR・SSG"
next_js_body = [
                      "NextJsSkillサンプル\n",
                      "サンプル\n",
                      "サンプル\n"
                    ].join(",").gsub(",","")

next_js_skill_hash = {title: next_js_title, body: next_js_body, me_id: 1}
NextJsSkill.create(next_js_skill_hash)

react_title = "Redux Redux-tool-kit atomic design formik"
react_body = [
                "ReactSkillサンプル\n",
                "サンプル\n",
                "サンプル\n"
              ].join(",").gsub(",","")

react_skill_hash = {title: react_title, body: react_body, me_id: 1}
ReactSkill.create(react_skill_hash)