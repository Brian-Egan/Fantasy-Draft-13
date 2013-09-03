class DraftsController < ApplicationController
  before_action :set_draft, only: [:show, :edit, :update, :destroy]

  # GET /drafts
  # GET /drafts.json
  def index
    @drafts = Draft.all
  end

  # GET /drafts/1
  # GET /drafts/1.json
  def show
  end

  # GET /drafts/new
  def new
    @draft = Draft.new
  end

  # GET /drafts/1/edit
  def edit
  end

  # POST /drafts
  # POST /drafts.json
  def create
    @overall = Draft.maximum("overall_pick")

    if Player.where(name: params[:name]).exists?
      @player = Player.where(name: params[:name]).take
      @playerID = @player.id
      @player.taken = true
      @player.save
    else
      @player = Player.create(:name => params[:name], :position => params[:position], :taken => true )
      @player.save
      @playerID = @player.id
    end



    # @teamID = Team.where(owner: params[:teamPick])
    # @tID = @teamID.id
    # @draft.team_id = @teamID





    @draft = Draft.new(:round => params[:round], :pick => params[:pick], :overall_pick => @overall, :team_id => params[:teamID], :player_id => @playerID)

    @draft.save

    # redirect_to active_path

    respond_to do |format|
      format.js { redirect_to active_path}
    end


    # respond_to do |format|
    #   if @draft.save
    #     redirect_to '/active'
    #     # format.html { redirect_to @draft, notice: 'Draft was successfully created.' }
    #     # format.json { render action: 'show', status: :created, location: @draft }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @draft.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /drafts/1
  # PATCH/PUT /drafts/1.json
  def update
    respond_to do |format|
      if @draft.update(draft_params)
        format.html { redirect_to @draft, notice: 'Draft was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @draft.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drafts/1
  # DELETE /drafts/1.json
  def destroy
    @draft.destroy
    respond_to do |format|
      format.html { redirect_to drafts_url }
      format.json { head :no_content }
    end
  end

  def active
    # @draft = Draft.new

    if Draft.count > 0
      if Draft.maximum("round") > 1
        @roundNum = Draft.maximum("round")
      else
        @roundNum = 1
      end

      @lastPick = Draft.find(Draft.maximum("id"))

      if @lastPick.pick == 12
          @roundNum = @roundNum += 1
          @pickNum = 1
      else
          @pickNum = @lastPick.pick + 1
      end

      @lpickNum = @lastPick.pick
      puts @roundNum
      puts @lpickNum
      puts @lastPick

      if @lastPick.pick == 12
        @teamID = @lastPick.team_id
      elsif (@roundNum.odd? && @lastPick.pick != 12)
        @teamID = (@lastPick.team_id + 1)
      elsif (@roundNum.odd? && @lastPick.pick == 12)
        @teamID = (@lastPick.team_id - 1)
      elsif (@roundNum.even? && @lastPick.pick != 12)
        @teamID = (@lastPick.team_id - 1)
      else
        @teamID = (@lastPick.team_id - 1)
      end

      @teamName = Team.find(@teamID)

      @currentRound = Draft.where(round: @roundNum).count

  else

      @roundNum = 1
      @pickNum = 1
      @teamID = 1
      @teamName = Team.find(@teamID)
      @currentRound = 1
  end

    if params[:page]
      @col1page = params[:page].to_i
    else
      @col1page = 1
    end

    @players = Player.avail

    @players1 = @players.paginate(:page => @col1page, :per_page => 7)
    @players2 = @players.paginate(:page => (@col1page + 1), :per_page => 7)
    @players3 = @players.paginate(:page => (@col1page + 2), :per_page => 7)

    @teams = Team.all.order("draft_order DESC").all

    @teamsList = Team.all.order("draft_order ASC").all

    if Team.find(12)
      @myPlayers = Team.find(12).players
      @myQBs = @myPlayers.where(:position => "QB")
      @myRBs = @myPlayers.where(:position => "RB")
      @myWRs = @myPlayers.where(:position => "WR")
      @myTEs = @myPlayers.where(:position => "TE")
      @myPKs = @myPlayers.where(:position => "PK")
      @myDefs = @myPlayers.where(:position => "DT")
    else
      @myPlayers = []
      @myQBs = []
      @myRBs = []
      @myWRs = []
      @myTEs = []
      @myPKs = []
      @myDefs = []
    end

    @posAvail = {
      "QB"=>2,
      "RB"=>2,
      "WR"=>2,
      "TE"=>1,
      "PK"=>1,
      "Def"=>1,
      "Flex"=>1,
      "Bench"=>7,
      "Total"=>15,
    }



    @nxtLink = (@col1page + 3)
    if @col1page > 3
      @prevLink = (@col1page - 3)
    end


    respond_to do |format|
          format.html
          format.js
    end
  end


    def sortPosition
      if params[:position] == "AllOff"
        @players = Player.avail.where(:position => ['QB','RB','WR','TE'])
      elsif params[:position] == "All"
        @players = Player.avail
      else
        @players = Player.avail.where(:position => params[:position])
      end
      @col1page = 1

      @roundNum = params[:round].to_i

       @players1 = @players.paginate(:page => @col1page, :per_page => 7)
       @players2 = @players.paginate(:page => (@col1page + 1), :per_page => 7)
      @players3 = @players.paginate(:page => (@col1page + 2), :per_page => 7)

    respond_to do |format|
          format.js
    end

    def sortByPoints
        
       @col1page = 1

      if params[:order] == "points"
        @players = Player.avail.order('rank3 DESC')
        @players1 = @players.paginate(:page => @col1page, :per_page => 7)
        @players2 = @players.paginate(:page => (@col1page + 1), :per_page => 7)
        @players3 = @players.paginate(:page => (@col1page + 2), :per_page => 7)
      else 
        @players = Player.avail.order('rank1 ASC')
        @players1 = @players.paginate(:page => @col1page, :per_page => 7)
        @players2 = @players.paginate(:page => (@col1page + 1), :per_page => 7)
        @players3 = @players.paginate(:page => (@col1page + 2), :per_page => 7)
      end

        # @players1 = @players.paginate(:page => @col1page, :per_page => 7)
        # @players2 = @players.paginate(:page => (@col1page + 1), :per_page => 7)
        # @players3 = @players.paginate(:page => (@col1page + 2), :per_page => 7)

    respond_to do |format|
              format.js
        end
      end


    def aTeamModal

      @posAvail = {
        "QB"=>2,
        "RB"=>2,
        "WR"=>2,
        "TE"=>1,
        "PK"=>1,
        "Def"=>1,
        "Flex"=>1,
        "Bench"=>7,
        "Total"=>15,
      }


      if Team.find(params[:teamID])
        @team = Team.find(params[:teamID])
        @tPlayers = @team.players
        @tQBs = @myPlayers.where(:position => "QB")
        @tRBs = @myPlayers.where(:position => "RB")
        @tWRs = @myPlayers.where(:position => "WR")
        @tTEs = @myPlayers.where(:position => "TE")
        @tPKs = @myPlayers.where(:position => "PK")
        @tDefs = @myPlayers.where(:position => "DT")
        @name = @team.owner
      else
        @tPlayers = []
        @tQBs = []
        @tRBs = []
        @tWRs = []
        @tTEs = []
        @tPKs = []
        @tDefs = []
      end

      respond_to do |format|
        format.js
      end

    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_draft
      @draft = Draft.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def draft_params
      params.require(:draft).permit(:round, :pick, :draft_team, :player_taken)
    end
end
