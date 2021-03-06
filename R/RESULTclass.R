# RESULTclass.R

# An instance of this class holds the set of results of a single test for a single section
# Each instance should be held within an instance of the REPORT class

RESULT = R6Class(
  
  classname = "RESULT",
  
  private = list(
    
    ItemResponses = NA,          # data.frame showing the response each student made on each item
    SectionName = NA_character_, # character of length 1 with the name of the section
    ItemResponseScores = NA,     # data.frame showing the points each student earned on each item
    Summary = NA,                # not sure.  It will be the stuff that shows up to the right on the Scores tab
    TopicScores = NA,            # data.frame with one row per student and one column per topic
    TopicSummary = NA,           # data.frame representing one column from the Topic Chart Calculation tab and part of one row from the Topics tab
    DropScores = NA,             # data.frame holding students' total points after dropping an item
    addr = paste0(getwd(),"/classes/RESULTclass/")
    
  ), # /private
  
  public = list(
    
    # Initialize method - new()
    initialize = function(SectionName){private$SectionName = SectionName},
    
    # Methods to set members
    setItemResponses =      function(sourceLocation, ItemInfo, TMS, result = self, messageLevel = 0){
      setItemResponses.RESULT(sourceLocation, ItemInfo, TMS, result, messageLevel)},
    setSectionName =        function(x){private$SectionName= x},
    setItemResponseScores = function(ItemInfo, TMS, HaltOnMultiResponse = F, result = self,  messageLevel = 0){
      setItemResponseScores.RESULT(ItemInfo, TMS, HaltOnMultiResponse, result, messageLevel)},
    setDropScores =         function(ItemInfo, result = self){ # This is part of calculating the item correlations
      setDropScores.RESULT(ItemInfo, result)},
    setSummary =            function(x){private$Summary= x},
    setTopicScores =        function(TopicAlignments, ItemInfo, result = self){
      setTopicScores.RESULT(TopicAlignments, ItemInfo, result)},
    setTopicSummary =       function(TopicScores){
      private$TopicSummary = apply(TopicScores[,-c(1:3), drop = F], 2, mean, na.rm = T)},
    
    # Methods to return members
    getItemResponses =      function(){return(private$ItemResponses)},
    getSectionName =        function(){return(private$SectionName)},
    getItemResponseScores = function(){return(private$ItemResponseScores)},
    getSummary =            function(){return(private$Summary)},
    getTopicScores =        function(){return(private$TopicScores)},
    getTopicSummary =       function(){return(private$TopicSummary)},
    getDropScores =         function(){return(private$DropScores)},
    
    # Methods to quick set members
    setIRSquick = function(x){private$ItemResponseScores = x},
    setIRquick =  function(x){private$ItemResponses = x},
    setDSquick =  function(x){private$DropScores = x},
    setTSquick =  function(x){private$TopicScores = x}
    
  ) # /public
  
) # /RESULT class
