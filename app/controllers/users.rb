get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/questions"
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  @user_questions = Question.where(user_id: params[:id])
  @user_answers = Answer.where(user_id: params[:id])
  @user_comments = Comment.where(user_id: params[:id])
  @user_answers.each do |answer|
    @question_answered = Question.find_by(id: answer.question_id)
  end
  erb :'/users/show'
end




