# R Final Project
## December 16, 2019


# Installing xlsx package
install.packages("xlsx")

# Loading xlsx package
library("xlsx")

# Get working directory
getwd()

# Import the data
data_lab <- read_excel("/Users/NavinShrestha/Desktop/RFinalProject//FINAL_ANTHOCYANIN_ LAB_TRIAL.xlsx", skip = 1)


View(data_lab)

# Trim the data (remove the missing and 'no plant' ds score data)
lab.data.nomissing <- data_lab[!is.na(data_lab[,3]),]

lab.data.nomissing <- lab.data.nomissing[lab.data.nomissing[,6] != 'no plants',]

summary(lab.data.nomissing)

attach(lab.data.nomissing)

lab.data.nomissing$`Ds score` <- as.numeric(lab.data.nomissing$`Ds score`)

lab.data.nomissing$Rep <- as.character(lab.data.nomissing$Rep)

summary(lab.data.nomissing)

View(lab.data.nomissing)

# Fit a model with ds score as response and group and rep as predictors
model.lab <- lm(`Ds score` ~ Group+Rep, data = lab.data.nomissing)

# View the anove table
anova(model.lab)

#1 line summary
print(paste("The Group and Rep have no effect on the ds score",
            "after controlling the effect of one-another."))

# Construct histogram for Anthocyanin Content

install.packages("histogram")
library("histogram")

lab.data.nomissing$`AnthocyaninContent` <- as.numeric(lab.data.nomissing$`AnthocyaninContent`)

hist(lab.data.nomissing$`AnthocyaninContent`,breaks=10,main="Distribution of Anthocyanin in BC1 population",ylab="Frquency of Genotypes",xlab="Anthocyanin Content(nmole/gfw)",col="Purple")



