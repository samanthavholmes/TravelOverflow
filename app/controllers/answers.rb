post '/questions/:question_id/answers' do
  @question = Question.find_by(id: params[:question_id])
  @answer = Answer.new(description: params[:description])
  @answers = @question.answers
  if @answer.save
    @question.answers << @answer
    if request.xhr?
      params[:id] = @answer.id
      params.to_json
    else
      redirect '/questions/:id'
    end
  else
    redirect "/questions/#{@question.id}/answers/new"
  end
end

get '/questions/:question_id/answers/new' do
  @question = Question.find_by(id: params[:question_id])
  erb :'/answers/new'
end

get '/questions/:question_id/answers/:answer_id' do
  @question= Question.find_by(id: params[:question_id])
  @answer= Answer.find_by(id: params[:answer_id])
  @comments = @answer.comments
  erb :'/comments/show'
end
