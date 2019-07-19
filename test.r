library(mlr)
library(OpenML)

test_classif = function(learner.id, task.id) {
  task = OpenML::getOMLTask(task.id)
  data.set = task$input$data.set$data
  target = task$input$target.features
  lrn = makeLearner(learner.id)
  task = makeClassifTask(data = data.set, target = target)
  model = train(lrn, task)
  predict(model, task)
}

test_regr = function(learner.id, task.id) {
  task = OpenML::getOMLTask(task.id)
  data.set = task$input$data.set$data
  target = task$input$target.features
  lrn = makeLearner(learner.id)
  task = makeRegrTask(data = data.set, target = target)
  model = train(lrn, task)
  predict(model, task)
}

classif.tasks = c(43)
classif.learners = c("classif.ranger", "classif.xgboost", "classif.kknn", "classif.glmnet", "classif.svm", "classif.rpart")
for(lrn in classif.learners) {
  for(t in classif.tasks) {
    test_classif(lrn, t)
  }
}

regr.tasks = c(4883)
regr.learners = c("regr.ranger", "regr.xgboost", "regr.kknn", "regr.glmnet", "regr.svm", "regr.rpart")
for(lrn in regr.learners) {
  for(t in regr.tasks) {
    test_regr(lrn, t)
  }
}