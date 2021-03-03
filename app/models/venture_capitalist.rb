class VentureCapitalist
    attr_accessor :name, :total_worth
    @@all = []
  
    def initialize(name, total_worth)
      @name = name
      @total_worth = total_worth
      @@all << self
    end
  
    def self.all
      @@all
    end
  
    def self.tres_commas_club
      VentureCapitalist.all.select{|vc| vc.total_worth >= 1000000000 }
    end
  
    def offer_contract(startup_obj, type, amount)
      FundingRound.new(startup_obj, self, type, amount)
    end
  
    def funding_rounds
      FundingRound.all.select{|funding_round| funding_round.venture_capitalist == self}
    end
  
    def portfolio
      portfolio = funding_rounds.map do |fr| 
        fr.startup
      end
      portfolio.uniq
    end
  
    def biggest_investment
      funding_rounds.max_by{|funding_round| funding_round.investment }
    end 
  
    def invested(domain)
      my_rounds = funding_rounds.select{|fr| fr.startup.domain == domain}
      total = my_rounds.sum{|fr| fr.investment }
      total
    end
  
  end