# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

acmesoft = Organization.create(name: 'Acme Software')
User.create(name: 'John McGarth', email: 'john@fnnny.com', password: 'latte4me', organization_id: acmesoft.id)
Authentication.create(organization_id: acmesoft.id, provider: 'quip', token: 'ZU1IQU1BT25DZFM=|1510733233|Jbt8mfIEv5lOYW2NRGRVPHKYVUzFMVqAeuceDXrlRvs=')

