df <- read.csv("Housing.csv")
str(df)
correlation <- cor(df)
correlation
df <- na.omit(df)
df$price <- as.factor(df$price)
df_set_size <- floor(nrow(df)*0.75)
index <- sample(1: nrow(df), size = df_set_size)
train <- df[index,]
test <- df[-index,]
train <- scale(train)
test <- scale(test)
linear <- glm(df$price~., data = train)
pred <- predict(linear, newdata = test)
plot(pred)

