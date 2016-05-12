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
      params[:id] = @question.id
      params.to_json
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
