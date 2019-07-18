library(mlr)
library(OpenML)

test_classif = function(learner.id) {
  data.set = OpenML::getOMLDataSet(44)
  lrn = makeLearner(learner.id)
  task = makeClassifTask(data = data.set$data, target = "class")
  model = train(lrn, task)
  predict(model, task)
}

learners = c("classif.ranger", "classif.xgboost", "classif.kknn", "classif.glmnet", "classif.svm", "classif.rpart")
for(lrn in learners) {
  test_classif(lrn)
}