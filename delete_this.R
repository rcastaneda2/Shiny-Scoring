
F2<-readRDS("data/Mod2F.RDS")

# Had an issue where my application stopped working after I updated mirt. There
# were significant changes to the mirt class. Extract data, model, and re-run
# using updated version of MIRT.

call <- F2@Call

mod.obj <- F2@Model$model$x

dat <- F2@Data$data


library(mirt)

mod <- mirt.model(c('P = 2,5-12, 
          S = 1,3,4,
          COV = P*S'))

res <- mirt(dat,mod)


saveRDS(res,"data\\F2_2.RDS")

