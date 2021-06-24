ActiveRecord::Base.connection.disable_referential_integrity do
  User.destroy_all
  Resource.destroy_all
  Badge.destroy_all
  Technology.destroy_all
  UsersBadge.destroy_all
  UsersTechnology.destroy_all
end

puts "Cleaned ✓"

User.create(
  username: "Admin",
  firstname: "マスター",
  lastname: "アドミニストレーター",
  email: "admin@admin",
  password: "admin",
  mentor_level: 666,
  is_admin: true
)

10.times do
  User.create(
    username: Faker::Internet.username,
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password"
  )
end

10.times do
  Resource.create(
    user_id: User.all.sample.id,
    title: Faker::Computer.stack,
    lead: Faker::Lorem.sentence(word_count: 10),
    content: Faker::Lorem.sentence(word_count: 35),
  )
end

1.times do
  Badge.create(
    name: 'Super Mentor !',
    img: 'CeciEstUnBadge',
  )
end
1.times do
  Badge.create(
    name: 'Mega Mentor !',
    img: 'CeciEstUnBadge',
  )
end

3.times do
  UsersBadge.create(
    user_id: User.all.sample.id,
    badge_id: Badge.all.sample.id
  )
end

5.times do
  Technology.create(
    name: ['Python', 'Java', 'JavaScript', 'TypeScript', 'Swift', 'Ruby', 'Rails', 'C', 'Angular', 'React', 'C#', 'Ruby on Rails', 'Angular', 'Vue.js', 'Symfony', 'Meteor', 'Bootstrap', 'Tailwind', 'React Native'].sample,
    
  )
end

5.times do
  UsersTechnology.create(
    user_id: User.all.sample.id,
    technology_id: Technology.all.sample.id
  )
end

5.times do
  UsersTechnology.create(
    user_id: User.all.sample.id,
    technology_id: Technology.all.sample.id
  )
end

puts "Seeding done ✓"
