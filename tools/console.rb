require_relative '../config/environment.rb'


# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


socialme = Startup.new("Socialme", 'Hadi Chloun', "platform media")
twitter = Startup.new('Twitter', 'Jack Dorsey', 'social media')
facebook = Startup.new('Facebook', 'Mark Z.', 'social media')
dollar_shave_club = Startup.new('Dollar Shave Club', 'Michael Dubin', 'Subscription service')
zuck_and_chan_foundation = Startup.new("Zuck and Chan Foundation", "Mark Z.", "Charity")
matt = VentureCapitalist.new('Matthew', 100)
bill_gates = VentureCapitalist.new('Bill Gates', 2000000000)
mark_cuban = VentureCapitalist.new('Mark Cuban', 1000000)

facebook_round_1 = FundingRound.new(facebook, bill_gates, 'Pre-Seed', 784)
facebook_round_2 = FundingRound.new(facebook, mark_cuban, 'Seed', 800000)
facebook_round_3 = FundingRound.new(facebook, mark_cuban, 'Seed', 8000000000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line