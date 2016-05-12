get '/questions/:question_id/answers/:answer_id/comments/new' do
  @question= Question.find_by(id: params[:question_id])
  @answer= Answer.find_by(id: params[:answer_id])
  erb :'/comments/new'
end

post '/questions/:question_id/answers/:answer_id' do
  @question= Question.find_by(id: params[:question_id])
  @answer= Answer.find_by(id: params[:answer_id])
  @comment = Comment.new(description: params[:description])
  if @comment.save
    @answer.comments << @comment
    current_user.comments << @comment
    redirect "questions/#{@question.id}/answers/#{@answer.id}"
  else
    @errors = @comment.errors.full_messages
    erb :'/comments/new'
  end
end

