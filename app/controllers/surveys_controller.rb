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

    #put the response in a hash
    hash = JSON.parse response.body
    # p "!!!!!!!!!!!!!!!!!!!!!! before merge"
    # p hash
    @user = User.find(params[:user_id])

    #add location and weather data to the survey
    @survey = @user.surveys.create survey_params.merge(:weatherMain => hash['weather'][0]['main'], :weatherDesc => hash['weather'][0]['description'], :dayTempHi => hash['main']['temp_max'], :dayTempLow => hash['main']['temp_min'], :currentTemp => hash['main']['temp'])
    # p hash
    # p"after merge !!!!!!!!!!!!!!!!!!!!!!!!!"
    if @survey.save
      p "Survey saved to DB!!!!!!!!!!!!!!!!!!!!!!"
      render json: true
    else
      p "Survey failed to DB!!!!!!!!!!!!!!!!!!!!!!"
      render json: false
    end
  end

  def update
    @survey = Survey.find(params[:id])

    if @survey.update(survey_params)

    else

    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    #do something?
  end

  private

    def survey_params
      params.require(:survey).permit(:coffees, :emotion, :user_id)
    end
end
