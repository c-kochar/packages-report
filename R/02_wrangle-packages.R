## create a data frame from data/installed-packages.csv
## with, e.g., readr::read_csv() or read.csv()

installed_packages<-fread(file=here("data","installed-packages.csv"))
#installed_packages2 <- read.csv(file="C:/Users/subha/Documents/packages-report/data/installed-packages.csv")

str(installed_packages)

## filter out packages in the default library
## keep variables Package and Built
## if you use dplyr, code like this will work:
#apt <- ipt %>%
#  filter(LibPath == .libPaths()[1]) %>%
#  select(Package, Built)
head(installed_packages$LibPath)
.libPaths()[1]
installed_packages2 <- installed_packages[LibPath == .libPaths()[1]]
installed_packages2 <- as.data.table(installed_packages2)
class(installed_packages2)

installed_packages2[, ':=' (x= NULL,
                            LibPath = NULL,
                            Version = NULL,
                            Priority = NULL)]
## write this new, smaller data frame to data/add-on-packages.csv
summary<-installed_packages2[,.N,by="Built"]
summary[,prop := summary$N/sum(summary$N)]

## make a frequency table of package by the version in Built
## if you use dplyr, code like this will work:
#apt_freqtable <- apt %>%
#  count(Built) %>%
#  mutate(prop = n / sum(n))

## write this data frame to data/add-on-packages-freqtable.csv
## YES overwrite the files that are there now
## they came from me (Jenny)
## they are just examples

## when this script works, stage & commit it and the csv files
## PUSH!
