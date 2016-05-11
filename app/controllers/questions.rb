get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end

get '/questions/new' do
  erb :'/questions/new'
end

post '/questions' do
  @question = Question.new(params[:question])
  if @question.save
    redirect "/questions"
  else
    @errors = @question.errors.full_messages
    erb :'/questions/new'
  end
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  erb :'/questions/show'
end

post '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  @answer = Answer.find_by(description: params[:description])
  if !@answer
    @answer = Answer.new(description: params[:description])
  end
  @answers = @question.answers
  if @answer.save
    @question.answers << @answer
    erb :"/answers/show"
  else
    redirect "/questions/#{@question.id}/answers/new"
  end
end
