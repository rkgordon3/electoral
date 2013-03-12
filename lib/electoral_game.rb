module ElectoralGame 
    include GameBase::Game
	#attr_accessor :start_date
    #Sattr_reader :configuration
    #
    # name designates configuration file
    #
	def configure(name)
		super
                @configuration = Configurator.new(name)
		@start_date = Date.new(2008, 9, 1)
	end

    def campaign_date(player) 
    	square = location(player)
    	@start_date + square[0]
    end


    def advance_campaign(player, ndays)
    	move(player, ndays)
    end

    def days_on_campaign(player) 
        (campaign_date(player) - @start_date).to_i
    end


    def to_tag(date) 
    	parts = date.to_s.split("-")
    	"c3d_#{parts[1].to_i.to_s}_#{parts[2].to_i.to_s}_#{parts[0]}"
    end

    def election_year
        @start_date.to_s.split("-")[0].to_i
    end

    def campaign_start_month
        @start_date.to_s.split("-")[1].to_i
    end

    def campaign_start_date
        @start_date.to_s.split("-")[2].to_i
    end


end
