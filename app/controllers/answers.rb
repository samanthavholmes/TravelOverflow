get '/questions/:question_id/answers' do
  @question = Question.find_by(id: params[:question_id])
  @answers = Answer.where(question_id: params[:question_id])
  erb :'/answers/show'
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
