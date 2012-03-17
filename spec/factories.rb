Factory.define :user do |user|
  user.name 'Josh'
  user.email 'qwerty@qwerty.qw'
end

Factory.define :task do |task|
  task.title "do!"
  task.content "telephasic workshop"
  task.do_before Date.today + 1
  task.association :user
end
