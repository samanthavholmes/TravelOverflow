post '/questions/:question_id/answers' do
  @question = Question.find_by(id: params[:question_id])
  @answer = Answer.new(description: params[:description], user_id: current_user.id)
  @answers = @question.answers
  @comments = @answer.comments
  if @answer.save
    @question.answers << @answer
    if request.xhr?
      erb :'/answers/_individual_answer', layout: false, locals: {answer: @answer, question: @question}
    end
  else
    redirect "/questions/#{@question.id}"
  end
end

get '/questions/:question_id/answers/:answer_id/answer' do
  @question= Question.find_by(id: params[:question_id])
  @answer= Answer.find_by(id: params[:answer_id])
  @comment = Comment.new(description: params[:description])
  @comments = @answer.comments
  if @comment.save
    @answer.comments << @comment
    if request.xhr?
      erb :'/comments/_individual_comment', layout: false, locals: {answer: @answer, question: @question, comment: @comment}
    end
  else
    redirect "/questions/#{@question.id}"
  end
end
