## deja vu from yesterday!

## create a data frame of your installed packages
library(data.table)
Inst_packg<- as.data.table(installed.packages())

## keep the variables
##   * Package
##   * LibPath
##   * Version
##   * Priority
##   * Built
str(Inst_packg)
Inst_packg[, ':=' (Depends =NULL,
                   Imports =NULL,
                   LinkingTo = NULL,
                   Suggests = NULL,
                   Enhances = NULL,
                   License = NULL,
                   License_is_FOSS = NULL,
                   License_restricts_use = NULL,
                   OS_type = NULL,
                   MD5sum = NULL,
                   NeedsCompilation = NULL)]

## write it to data/installed-packages.csv
## YES overwrite the file that is there now
## that came from me (Jenny)
## it an example of what yours should look like
install.packages("here")
library(here)
system("tree")
write.csv(Inst_packg,here("data","installed-packages.csv"))

## when this script works, stage & commit it and the csv file
## PUSH!
