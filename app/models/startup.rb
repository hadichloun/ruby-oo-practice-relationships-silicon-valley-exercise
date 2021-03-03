class Startup
    attr_reader :founder, :domain
    attr_accessor :name
    @@all = []
  
    def initialize(name, founder, domain)
      @name = name
      @founder = founder
      @domain = domain
      @@all << self
    end
  
    def self.all
      @@all
    end
  
    def pivot(name, domain)
      @name = name
      @domain = domain
    end
  
    def self.find_by_founder(founder_name)
      @@all.find { |startup| startup.founder == founder_name }
    end
  
    def self.domains
      @@all.map { |startup| startup.domain }
    end
  
    def sign_contract(venture_capitalist, type, amount_invested)
      FundingRound.new(self, venture_capitalist, type, amount_invested)
    end
  
    def num_funding_rounds
      funding_rounds.size
    end
  
    def total_funds
      funding_rounds.sum{ |round| round.investment }
    end
  
    def investors
      funding_rounds.map { |round| round.venture_capitalist }.uniq
    end
  
    def big_investors 
      investors.select { |investor| VentureCapitalist.tres_commas_club.include?(investor) }
    end
  
    # Helper Methods
    def funding_rounds 
      FundingRound.all.select { |round| round.startup == self }
    end 
  end