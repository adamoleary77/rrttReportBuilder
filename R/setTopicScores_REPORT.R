# setTopicScores_REPORT

setTopicScores.REPORT = function(report, messageLevel = 0) {
  
  if(messageLevel > 0){
    message("Running setTopicScores.REPORT")
  }
  
  # pull the necessary stuff from the report
  HasTopics = report$checkTopics()
  Results = report$getResults()
  
  # initialize the topic scores object
  TopicScores = NULL
  
  if(HasTopics){
    
    #establish a list that will hold the Topic Scores data.frames
    TopicScores = vector(mode = "list", length = length(Results))
    
    #pull the topic scores for each section and load them in the list
    for(i in 1:length(Results)){
      currentResult = Results[[i]]
      TopicScores[[i]] = currentResult$getTopicScores()
    }
    
    #make a single data.table with all of the item response scores from all of the sections
    TopicScores = data.table::rbindlist(TopicScores) 
    
  } # /if HasTopics 
  
  report$setTopicScoresQuick(TopicScores)
  
} # /function
