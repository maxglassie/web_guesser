require 'sinatra'
require 'sinatra/reloader'

def initialize
  @color = nil
end

SECRET_NUMBER = rand(100)

def check_guess(guess)
  if (guess - 5) > SECRET_NUMBER
    @color = "background: red"
    "Way too high!"
  elsif (guess + 5) < SECRET_NUMBER
    @color = "background: pink"
    "Way too low!"
  elsif guess > SECRET_NUMBER
    @color = "background: pink"
    "Too high!"
  elsif guess < SECRET_NUMBER
    @color = "background: pink"
    "Too low!"
  else
    @color = "background: green"
    "You got it right! The SECRET NUMBER is #{SECRET_NUMBER}"
  end
end


get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess)
  color = @color
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :color => @color}
end
