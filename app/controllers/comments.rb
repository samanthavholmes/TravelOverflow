get '/questions/:question_id/answers/:answer_id/comments/new' do
  @question= Question.find_by(id: params[:question_id])
  @answer= Answer.find_by(id: params[:answer_id])
  erb :'/comments/new'
end

post '/questions/:question_id/answers/:answer_id/answer_comment' do
  @question= Question.find_by(id: params[:question_id])
  @answer= Answer.find_by(id: params[:answer_id])
  @comment = Comment.new(description: params[:description])
  if @comment.save
    @answer.comments << @comment
    current_user.comments << @comment
    if request.xhr?
       erb :'/comments/_individual_comment', layout: false, locals: {comment: @comment}
     else
    redirect "questions/#{@question.id}/answers/#{@answer.id}"
  end
  else
    @errors = @comment.errors.full_messages
    erb :'/comments/new'
  end
end

post '/questions/:question_id/question_comment' do

  @question= Question.find_by(id: params[:question_id])
  @comment = Comment.new(description: params[:description])
  if @comment.save
    @question.comments << @comment
    current_user.comments << @comment
    if request.xhr?
       erb :'/comments/_individual_comment', layout: false, locals: {comment: @comment}
     else
    redirect "questions/#{@question.id}"
  end
  else
    @errors = @comment.errors.full_messages
    erb :'/comments/new'
  end
end

