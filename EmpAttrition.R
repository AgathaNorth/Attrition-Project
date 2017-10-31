library(tidyverse)
library(lubridate)


#Questions for the data;
#1: How many users that were actively engaged by the App, either with frequent comments or likes/dislikes, churned?
#2: Was negative user engagement, lots of dislikes and low mood votes, a significant factor for churning?
#3: What was the most common trend between users that did churn?


#Read Data

votes <- read.csv("DHAD/votes.csv")
churn <- read.csv("DHAD/churn.csv")
comments <- read.csv("DHAD/comments_clean_anonimized.csv")
interaction <- read.csv("DHAD/commentInteractions.csv")

#Clean Dates

votes$voteDate <- gsub("CET","",votes$voteDate)
votes$voteDate <- gsub("CEST","",votes$voteDate)
votes$voteDate <- gsub("  "," ",votes$voteDate)
votes$voteDate <- parse_date_time(votes$voteDate, "%a %b %d %H:%M:%S %Y")

churn$lastParticipationDate <- gsub("CET","",churn$lastParticipationDate)
churn$lastParticipationDate <- gsub("CEST","",churn$lastParticipationDate)
churn$lastParticipationDate <- gsub("  "," ",churn$lastParticipationDate)
churn$lastParticipationDate <- parse_date_time(churn$lastParticipationDate, "%a %b %d %H:%M:%S %Y")
  
comments$commentDate <- gsub("CET","",comments$commentDate)
comments$commentDate <- gsub("CEST","",comments$commentDate)
comments$commentDate <- gsub("  "," ",comments$commentDate)
comments$commentDate <- parse_date_time(comments$commentDate, "%a %b %d %H:%M:%S %Y")

#Company Names

levels(votes$companyAlias) <- c("C1","C2","C3","C4","C5","C6","C7","C8","C9","C10","C11","C12","C13","C14","C15","C16","C17","C18","C19","C20","C21","C22","C23","C24","C25","C26","C27","C28","C29","C30","C31","C32","C33","C34","C35","C36","C37")
levels(churn$companyAlias) <- c("C1","C2","C3","C4","C5","C6","C7","C8","C9","C10","C11","C12","C13","C14","C15","C16","C17","C18","C19","C20","C21","C22","C23","C24","C25","C26","C27","C28","C29","C30","C31","C32","C33","C34","C35","C36","C37")
levels(comments$companyAlias) <- c("C1","C2","C3","C4","C5","C6","C7","C8","C9","C10","C11","C12","C13","C14","C15","C16","C17","C18","C19","C20","C21","C22","C23","C24","C25","C26","C27","C28","C29","C30","C31","C32","C33","C34","C35","C36")
levels(interaction$companyAlias) <- c("C1","C2","C3","C4","C5","C6","C7","C8","C9","C10","C11","C12","C13","C14","C15","C16","C17","C18","C19","C20","C21","C22","C23","C24","C25","C26","C27","C28","C29","C30","C31","C32","C33","C34","C35")

#Rename

colnames(churn)[4] <- c("lastPostDate")
