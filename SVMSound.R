#Takes the string response var and turns it into a binary var
voice$female <- ifelse(voice$label == 'female', 1, 0)

#Split trian and validation data

library(e1071)

set.seed(456)

split <- sample(1:nrow(voice), ceiling(.75*nrow(voice)))

train <- voice[split,]

valid <- voice[-split,]

#Fit a SVM. The function syntax is very similar to lm function

model_svm <- svm(female ~ . , train)

save(model_svm, file = 'sound_svm.rda')

#Use the predictions on the data

pred_valid <- predict(model_svm, valid)






