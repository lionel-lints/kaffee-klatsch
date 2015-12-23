# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create({"username" => "lionel", "email" => "lionel", "password" => "lionel"})
User.create({"username" => "alina", "email" => "alina", "password" => "alina"})
User.create({"username" => "bond", "email" => "bond", "password" => "bond"})


Survey.create({"user_id"=>1, "coffees" => 1, "emotion" => 2.4, "weatherMain" => "rainy", "weatherDesc" => "light rain", "dayTempHi" => 50.4, "dayTempLow" => 39.2, "currentTemp" => 41.2, "created_at"=>"2015-12-01 07:00:00"})
Survey.create({"user_id"=>1, "coffees" => 2, "emotion" => 3.3, "weatherMain" => "rainy", "weatherDesc" => "light rain", "dayTempHi" => 50.4, "dayTempLow" => 39.2, "currentTemp" => 42.1, "created_at"=>"2015-12-01 09:00:00"})
# Survey.create({"user_id"=>1, "coffees" => 5, "emotion" => 2, "weatherMain" => "", "weatherDesc" => "", "dayTempHi" => "", "dayTempLow" => "", "currentTemp" => "", })
# Survey.create({"user_id"=>1, "coffees" => 4, "emotion" => 3, "weatherMain" => "", "weatherDesc" => "", "dayTempHi" => "", "dayTempLow" => "", "currentTemp" => "", })
# Survey.create({"user_id"=>2, "coffees" => 0, "emotion" => 4, "weatherMain" => "", "weatherDesc" => "", "dayTempHi" => "", "dayTempLow" => "", "currentTemp" => "", })
# Survey.create({"user_id"=>2, "coffees" => 1, "emotion" => 4, "weatherMain" => "", "weatherDesc" => "", "dayTempHi" => "", "dayTempLow" => "", "currentTemp" => "", })
# Survey.create({"user_id"=>2, "coffees" => 2, "emotion" => 2, "weatherMain" => "", "weatherDesc" => "", "dayTempHi" => "", "dayTempLow" => "", "currentTemp" => "", })
# Survey.create({"user_id"=>2, "coffees" => 1, "emotion" => 5, "weatherMain" => "", "weatherDesc" => "", "dayTempHi" => "", "dayTempLow" => "", "currentTemp" => "", })
# Survey.create({"user_id"=>2, "coffees" => 0, "emotion" => 1, "weatherMain" => "", "weatherDesc" => "", "dayTempHi" => "", "dayTempLow" => "", "currentTemp" => "", })
# Survey.create({"user_id"=>2, "coffees" => 0, "emotion" => 3, "weatherMain" => "", "weatherDesc" => "", "dayTempHi" => "", "dayTempLow" => "", "currentTemp" => "", })
# Survey.create({"user_id"=>3, "coffees" => "6", "emotion" => 3, "weatherMain" => "", "weatherDesc" => "", "dayTempHi" => "", "dayTempLow" => "", "currentTemp" => "", })
# Survey.create({"user_id"=>3, "coffees" => 5, "emotion" => 4, "weatherMain" => "", "weatherDesc" => "", "dayTempHi" => "", "dayTempLow" => "", "currentTemp" => "", })
# Survey.create({"user_id"=>3, "coffees" => 4, "emotion" => 5, "weatherMain" => "", "weatherDesc" => "", "dayTempHi" => "", "dayTempLow" => "", "currentTemp" => "", })
# Survey.create({"user_id"=>3, "coffees" => 3, "emotion" => 2, "weatherMain" => "", "weatherDesc" => "", "dayTempHi" => "", "dayTempLow" => "", "currentTemp" => "", })
# Survey.create({"user_id"=>3, "coffees" => 2, "emotion" => 1, "weatherMain" => "", "weatherDesc" => "", "dayTempHi" => "", "dayTempLow" => "", "currentTemp" => "", })
# Survey.create({"user_id"=>3, "coffees" => 1, "emotion" => 1, "weatherMain" => "", "weatherDesc" => "", "dayTempHi" => "", "dayTempLow" => "", "currentTemp" => "", })
# Survey.create({"user_id"=>3, "coffees" => 4, "emotion" => 2, "weatherMain" => "", "weatherDesc" => "", "dayTempHi" => "", "dayTempLow" => "", "currentTemp" => "", })
