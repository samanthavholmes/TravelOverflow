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
    current_user.questions << @question
    if request.xhr?
      erb :'/questions/_individual_question', layout: false, locals: {question: @question, answer: @answer}
    else
      redirect '/questions'
    end
  else
    @errors = @question.errors.full_messages
    erb :'/questions/new'
  end
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  @answers = Answer.where(question_id: params[:id])
  erb :'/questions/show'
end

post '/questions/:id/upvote' do
  @question = Question.find_by(id: params[:id])
  @question.votes.create(value: 1)

  if request.xhr?
    {points: @question.points}.to_json
  else
    redirect "/questions/#{@question.id}"
  end
end

post '/questions/:id/downvote' do
  @question = Question.find_by(id: params[:id])
  @question.votes.create(value: -1)

  if request.xhr?
    {points: @question.points}.to_json
  else
    redirect "/questions/#{@question.id}"
  end
end
