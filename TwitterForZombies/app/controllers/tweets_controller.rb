class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_action :get_zombie



  def get_zombie

    @zombie = Zombie.find(params[:zombie_id])

  end
  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = @zombie.tweets.all
  end

  # GET zombies/zombie_id/tweets/id
  # GET /tweets/1.json
  def show
    @tweet = @zombie.tweets.find(params[:id])
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new()
  end

  # GET /tweets/1/edit
  def edit

  end

  # POST /tweets
  # POST /tweets.json
  def create

    @tweet = @zombie.tweets.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to [@zombie, @tweet],
                                  notice: 'Tweet was successfully created.' }
        format.json { render json: [@zombie, @tweet ] ,
                             status: :created,
                             location: [@zombie, @tweet ] }

      else
        format.html { render :new }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    t_status = params.require(:tweet).permit(:status, :zombie_id)

    respond_to do |format|
      if @tweet.update(t_status)
        format.html { redirect_to [@zombie, @tweet], notice: 'Tweet was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
     @tweet.destroy
    respond_to do |format|
      format.html { redirect_to [@zombie, @tweet], notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:zombie_id, :status)

    end

  def yyyy
    'cfhfd'
  end
end
