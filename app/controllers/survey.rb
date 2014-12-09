get '/survey/:id' do
  @survey = Survey.find(params[:id])
  erb :survey
end

post '/answer' do
  r_new = Respsurvey.create(user_id: session[:user].id, survey_id:params[:survey_id])

  # k.each do |v|
  #   puts params[:data][v]
  # end

  params["choices"].each do |c|
    a_new = Answer.create(choice_id: c[1], respsurvey_id:r_new.id)
  end
  # q = Question.create(survey_id: s.id)
  # Choice.create(question_id: q.id)
  # params[:data].each do |p|
  #   puts p
  # end
  erb :index
end

post '/create' do
  i = 0

  s_new = Survey.create(user_id:session[:user].id,title:params[:title])
  params["questions"].each do |q|
    q_new = Question.create(survey_id:s_new.id, body:q[1])
    params["choices"][i.to_s].each do |c|
      Choice.create(question_id:q_new.id,body:c[1]);
    end
    i += 1
  end

    redirect to ('/survey/' << s_new.id.to_s)
end