puts 'SETTING UP EVENT TYPES'
event_type1 = EventType.create! :name => 'Ambassador'
puts 'New eventType created: ' << event_type1.name

event_type2 = EventType.create! :name => 'Commencement'
puts 'New eventType created: ' << event_type2.name

event_type3 = EventType.create! :name => 'Fundraising'
puts 'New eventType created: ' << event_type3.name

event_type4 = EventType.create! :name => 'Hosting'
puts 'New eventType created: ' << event_type4.name

event_type5 = EventType.create! :name => 'Meeting'
puts 'New eventType created: ' << event_type5.name

event_type6 = EventType.create! :name => 'Panel'
puts 'New eventType created: ' << event_type6.name

event_type7 = EventType.create! :name => 'Tour'
puts 'New eventType created: ' << event_type7.name

event_type8 = EventType.create! :name => 'Other'
puts 'New eventType created: ' << event_type8.name

event_type9 = EventType.create! :name => 'Recruitment'
puts 'New eventType created: ' << event_type9.name

event_type10 = EventType.create! :name => 'Study Hours'
puts 'New eventType created: ' << event_type10.name


puts 'SETTING UP CREDIT TYPES'
credit_type1 = CreditType.create! :name => 'Event'
puts 'New creditType created: ' << credit_type1.name

credit_type2 = CreditType.create! :name => 'Committee'
puts 'New creditType created: ' << credit_type2.name

credit_type3 = CreditType.create! :name => 'Office Hours'
puts 'New creditType created: ' << credit_type3.name

credit_type4 = CreditType.create! :name => 'No Credit'
puts 'New creditType created: ' << credit_type4.name


puts 'SETTING UP APPAREL'
apparel1 = Apparel.create! :name => 'Full Dress Uniform'
puts 'New apparel created: ' << apparel1.name

apparel2 = Apparel.create! :name => 'Formal'
puts 'New apparel created: ' << apparel2.name

apparel3 = Apparel.create! :name => 'Casual'
puts 'New apparel created: ' << apparel3.name

apparel4 = Apparel.create! :name => 'Tour Casual'
puts 'New apparel created: ' << apparel4.name

apparel5 = Apparel.create! :name => 'Ambassador T-Shirt'
puts 'New apparel created: ' << apparel5.name

apparel6 = Apparel.create! :name => 'Everyday'
puts 'New apparel created: ' << apparel6.name

apparel7 = Apparel.create! :name => 'Recruitment'
puts 'New apparel created: ' << apparel7.name

apparel8 = Apparel.create! :name => 'Other'
puts 'New apparel created: ' << apparel8.name


puts 'SETTING UP EVENT REGISTRATION STATUSES'
registration_status1 = RegistrationStatus.create! :name => 'Will attend'
puts 'New registrationStatus created: ' << registration_status1.name

registration_status2 = RegistrationStatus.create! :name => 'Attended'
puts 'New registrationStatus created: ' << registration_status2.name

registration_status3 = RegistrationStatus.create! :name => 'Canceled'
puts 'New registrationStatus created: ' << registration_status3.name

puts 'SETTING UP COMMITTEES'
committee1 = Committee.create! :name => 'Student Recruitment'
puts 'New committee created: ' << committee1.name

committee2 = Committee.create! :name => 'Fundraising'
puts 'New committee created: ' << committee2.name

committee3 = Committee.create! :name => 'Leadership & Training'
puts 'New committee created: ' << committee3.name

committee4 = Committee.create! :name => 'Special Events'
puts 'New committee created: ' << committee4.name

committee5 = Committee.create! :name => 'Public Relations'
puts 'New committee created: ' << committee5.name

committee6 = Committee.create! :name => 'Membership Recognition'
puts 'New committee created: ' << committee6.name

committee7 = Committee.create! :name => 'Selections'
puts 'New committee created: ' << committee7.name
