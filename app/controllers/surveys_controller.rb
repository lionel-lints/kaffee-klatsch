class SurveysController < ApplicationController

  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def new
    @survey = Survey.new
    @user = User.find(params[:user_id])
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def create

    location = Typhoeus.post('https://www.googleapis.com/geolocation/v1/geolocate?key=' + ENV['COFFEE_TIME_GOOGLE_GEOLOCATION'], body: {})
    location = JSON.parse location.response_body
    lat = location['location']['lat'].round(4)
    lon = location['location']['lng'].round(4)
    response = HTTParty.get('http://api.openweathermap.org/data/2.5/weather?lat=' + lat.to_s + '&units=imperial&lon=' + lon.to_s + '&type=accurate&appid=' + ENV['COFFEE_TIME_APP'])
    hash = JSON.parse response.body

    p 'http://api.openweathermap.org/data/2.5/weather?lat=' + lat.to_s + '&units=imperial&lon=' + lon.to_s + '&appid=' + ENV['COFFEE_TIME_APP']

    @user = User.find(params[:user_id])
    @survey = @user.surveys.create survey_params.merge(:weatherMain => hash['weather'][0]['main'], :weatherDesc => hash['weather'][0]['description'], :dayTempHi => hash['main']['temp_max'], :dayTempLow => hash['main']['temp_min'], :currentTemp => hash['main']['temp'])
    @user = User.find(params[:user_id])
    @survey = @user.surveys.create survey_params

    respond_to do |format|
      if @survey.save
        format.html { redirect_to user_surveys_path(@user, @survey), notice: 'Survey was successfully created.' }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @survey = Survey.find(params[:id])
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to @survey, notice: 'Survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    respond_to do |format|
      format.html { redirect_to user_surveys_path(@survey.user_id), notice: 'Survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def survey_params
      params.require(:survey).permit(:coffees, :emotion)
    end
end
