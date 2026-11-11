# Optional demo data. Never delete real users or products during seeding.
# Configure a demo account explicitly if you want a sample baker.
if ENV['DEMO_BAKER_EMAIL'].present? && ENV['DEMO_BAKER_PASSWORD'].present?
  user = User.find_or_initialize_by(email: ENV['DEMO_BAKER_EMAIL'])
  user.assign_attributes(
    first_name: 'Demo',
    last_name: 'Baker',
    password: ENV['DEMO_BAKER_PASSWORD'],
    location: 'San Francisco',
    bio: 'I bake fresh treats.',
    age: 25
  )
  user.save!
end
