setwd("C:/Users/danny/OneDrive - 中國醫藥大學/文件/R_project/CSN6/proteomics_data_comparison")
getwd()
library(enrichR)
listEnrichrSites()
setEnrichrSite("Enrichr") # Human genes
websiteLive <- TRUE
dbs <- listEnrichrDbs()
if (is.null(dbs)) websiteLive <- FALSE
if (websiteLive) head(dbs)

dbs_GO_Biological_Process_2021 <- c("GO_Biological_Process_2021")
df <- 
  read.csv(file = "comparison.csv", header = TRUE)
if (websiteLive) {
  negatively_enriched_GO_Biological_Process_2021 <- 
    enrichr(df$negative, 
            dbs_GO_Biological_Process_2021)
}
if (websiteLive) 
  negatively_enriched_GO_Biological_Process_2021[["GO_Biological_Process_2021"]]
if (websiteLive) 
  plotEnrich(negatively_enriched_GO_Biological_Process_2021[["GO_Biological_Process_2021"]], 
             showTerms = 20, 
             numChar = 100, 
             y = "Count", 
             orderBy = "P.value")
write.csv(negatively_enriched_GO_Biological_Process_2021[["GO_Biological_Process_2021"]],
                              file = "negatively_enriched_GO_Biological_Process_2021.csv")


dbs_MSigDB_Oncogenic_Signatures <- c("MSigDB_Oncogenic_Signatures")
if (websiteLive) {
  negatively_enriched_MSigDB_Oncogenic_Signatures <- 
    enrichr(df$negative, 
            dbs_MSigDB_Oncogenic_Signatures)
}
if (websiteLive) 
  negatively_enriched_MSigDB_Oncogenic_Signatures[["MSigDB_Oncogenic_Signatures"]]
if (websiteLive) 
  plotEnrich(negatively_enriched_MSigDB_Oncogenic_Signatures[["MSigDB_Oncogenic_Signatures"]], 
             showTerms = 20, 
             numChar = 100, 
             y = "Count", 
             orderBy = "P.value")
write.csv(negatively_enriched_MSigDB_Oncogenic_Signatures[["MSigDB_Oncogenic_Signatures"]],
          file = "negatively_enriched_MSigDB_Oncogenic_Signatures.csv")
