library(data.table)
library(lubridate)
library(ggplot2)
library(grid)
source("fjm_func.R")

# Read Visitors data ====

fjm_visitors <- readVisitorData()
fjm_visitors <- fjm_visitors[Date >= "2016-01-01"]
fjm_visitors[is.na(visitors)]$visitors = 0
head(fjm_visitors)
tail(fjm_visitors)
summary(fjm_visitors)
str(fjm_visitors)

# Read GA data ====
ga_allws_nochn_all <- readQueryExplorerData("data/ga/fjm_allws_nochn_all.tsv", c("Date"))
ga_allws_nochn_os <- readQueryExplorerData("data/ga/fjm_allws_nochn_os.tsv", c("Date"))
ga_allws_nochn_es <- readQueryExplorerData("data/ga/fjm_allws_nochn_es.tsv", c("Date"))
ga_allws_nochn_do <- readQueryExplorerData("data/ga/fjm_allws_nochn_do.tsv", c("Date"))
ga_allws_nochn_lo <- readQueryExplorerData("data/ga/fjm_allws_nochn_lo.tsv", c("Date"))

ga_allws_chn_all <- readQueryExplorerData("data/ga/fjm_allws_chn_all.tsv", c("Date", "Channel"))
ga_allws_chn_os <- readQueryExplorerData("data/ga/fjm_allws_chn_os.tsv", c("Date", "Channel"))
ga_allws_chn_es <- readQueryExplorerData("data/ga/fjm_allws_chn_es.tsv", c("Date", "Channel"))
ga_allws_chn_do <- readQueryExplorerData("data/ga/fjm_allws_chn_do.tsv", c("Date", "Channel"))
ga_allws_chn_lo <- readQueryExplorerData("data/ga/fjm_allws_chn_lo.tsv", c("Date", "Channel"))

ga_arte_nochn_all <- readQueryExplorerData("data/ga/fjm_arte_nochn_all.tsv", c("Date"))
ga_arte_nochn_os <- readQueryExplorerData("data/ga/fjm_arte_nochn_os.tsv", c("Date"))
ga_arte_nochn_es <- readQueryExplorerData("data/ga/fjm_arte_nochn_es.tsv", c("Date"))
ga_arte_nochn_do <- readQueryExplorerData("data/ga/fjm_arte_nochn_do.tsv", c("Date"))
ga_arte_nochn_lo <- readQueryExplorerData("data/ga/fjm_arte_nochn_lo.tsv", c("Date"))

ga_arte_chn_all <- readQueryExplorerData("data/ga/fjm_arte_chn_all.tsv", c("Date", "Channel"))
ga_arte_chn_os <- readQueryExplorerData("data/ga/fjm_arte_chn_os.tsv", c("Date", "Channel"))
ga_arte_chn_es <- readQueryExplorerData("data/ga/fjm_arte_chn_es.tsv", c("Date", "Channel"))
ga_arte_chn_do <- readQueryExplorerData("data/ga/fjm_arte_chn_do.tsv", c("Date", "Channel"))
ga_arte_chn_lo <- readQueryExplorerData("data/ga/fjm_arte_chn_lo.tsv", c("Date", "Channel"))

ga_bibliotecas_nochn_all <- readQueryExplorerData("data/ga/fjm_bibliotecas_nochn_all.tsv", c("Date"))
ga_bibliotecas_nochn_os <- readQueryExplorerData("data/ga/fjm_bibliotecas_nochn_os.tsv", c("Date"))
ga_bibliotecas_nochn_es <- readQueryExplorerData("data/ga/fjm_bibliotecas_nochn_es.tsv", c("Date"))
ga_bibliotecas_nochn_do <- readQueryExplorerData("data/ga/fjm_bibliotecas_nochn_do.tsv", c("Date"))
ga_bibliotecas_nochn_lo <- readQueryExplorerData("data/ga/fjm_bibliotecas_nochn_lo.tsv", c("Date"))

ga_bibliotecas_chn_all <- readQueryExplorerData("data/ga/fjm_bibliotecas_chn_all.tsv", c("Date", "Channel"))
ga_bibliotecas_chn_os <- readQueryExplorerData("data/ga/fjm_bibliotecas_chn_os.tsv", c("Date", "Channel"))
ga_bibliotecas_chn_es <- readQueryExplorerData("data/ga/fjm_bibliotecas_chn_es.tsv", c("Date", "Channel"))
ga_bibliotecas_chn_do <- readQueryExplorerData("data/ga/fjm_bibliotecas_chn_do.tsv", c("Date", "Channel"))
ga_bibliotecas_chn_lo <- readQueryExplorerData("data/ga/fjm_bibliotecas_chn_lo.tsv", c("Date", "Channel"))

ga_conferencias_nochn_all <- readQueryExplorerData("data/ga/fjm_conferencias_nochn_all.tsv", c("Date"))
ga_conferencias_nochn_os <- readQueryExplorerData("data/ga/fjm_conferencias_nochn_os.tsv", c("Date"))
ga_conferencias_nochn_es <- readQueryExplorerData("data/ga/fjm_conferencias_nochn_es.tsv", c("Date"))
ga_conferencias_nochn_do <- readQueryExplorerData("data/ga/fjm_conferencias_nochn_do.tsv", c("Date"))
ga_conferencias_nochn_lo <- readQueryExplorerData("data/ga/fjm_conferencias_nochn_lo.tsv", c("Date"))

ga_conferencias_chn_all <- readQueryExplorerData("data/ga/fjm_conferencias_chn_all.tsv", c("Date", "Channel"))
ga_conferencias_chn_os <- readQueryExplorerData("data/ga/fjm_conferencias_chn_os.tsv", c("Date", "Channel"))
ga_conferencias_chn_es <- readQueryExplorerData("data/ga/fjm_conferencias_chn_es.tsv", c("Date", "Channel"))
ga_conferencias_chn_do <- readQueryExplorerData("data/ga/fjm_conferencias_chn_do.tsv", c("Date", "Channel"))
ga_conferencias_chn_lo <- readQueryExplorerData("data/ga/fjm_conferencias_chn_lo.tsv", c("Date", "Channel"))

ga_engws_nochn_all <- readQueryExplorerData("data/ga/fjm_engws_nochn_all.tsv", c("Date"))
ga_engws_nochn_os <- readQueryExplorerData("data/ga/fjm_engws_nochn_os.tsv", c("Date"))
ga_engws_nochn_es <- readQueryExplorerData("data/ga/fjm_engws_nochn_es.tsv", c("Date"))
ga_engws_nochn_do <- readQueryExplorerData("data/ga/fjm_engws_nochn_do.tsv", c("Date"))
ga_engws_nochn_lo <- readQueryExplorerData("data/ga/fjm_engws_nochn_lo.tsv", c("Date"))

ga_engws_chn_all <- readQueryExplorerData("data/ga/fjm_engws_chn_all.tsv", c("Date", "Channel"))
ga_engws_chn_os <- readQueryExplorerData("data/ga/fjm_engws_chn_os.tsv", c("Date", "Channel"))
ga_engws_chn_es <- readQueryExplorerData("data/ga/fjm_engws_chn_es.tsv", c("Date", "Channel"))
ga_engws_chn_do <- readQueryExplorerData("data/ga/fjm_engws_chn_do.tsv", c("Date", "Channel"))
ga_engws_chn_lo <- readQueryExplorerData("data/ga/fjm_engws_chn_lo.tsv", c("Date", "Channel"))

ga_musica_nochn_all <- readQueryExplorerData("data/ga/fjm_musica_nochn_all.tsv", c("Date"))
ga_musica_nochn_os <- readQueryExplorerData("data/ga/fjm_musica_nochn_os.tsv", c("Date"))
ga_musica_nochn_es <- readQueryExplorerData("data/ga/fjm_musica_nochn_es.tsv", c("Date"))
ga_musica_nochn_do <- readQueryExplorerData("data/ga/fjm_musica_nochn_do.tsv", c("Date"))
ga_musica_nochn_lo <- readQueryExplorerData("data/ga/fjm_musica_nochn_lo.tsv", c("Date"))

ga_musica_chn_all <- readQueryExplorerData("data/ga/fjm_musica_chn_all.tsv", c("Date", "Channel"))
ga_musica_chn_os <- readQueryExplorerData("data/ga/fjm_musica_chn_os.tsv", c("Date", "Channel"))
ga_musica_chn_es <- readQueryExplorerData("data/ga/fjm_musica_chn_es.tsv", c("Date", "Channel"))
ga_musica_chn_do <- readQueryExplorerData("data/ga/fjm_musica_chn_do.tsv", c("Date", "Channel"))
ga_musica_chn_lo <- readQueryExplorerData("data/ga/fjm_musica_chn_lo.tsv", c("Date", "Channel"))


# Create weekend dataframe ====

daysinfo <- data.table(Date = seq(as.Date("2016-01-01"), as.Date("2018-06-24"), by = "day"))
daysinfo$weekNum <- wday(daysinfo$Date, week_start = 1)
daysinfo$monthNum <- mday(daysinfo$Date)
daysinfo$isFirstSunday <- wday(daysinfo$Date, week_start = 1) == 7 & day(daysinfo$Date) <= 7


# Exploring Visitors ====

ggplot(fjm_visitors, aes(Date, visitors)) +
  geom_vline(xintercept = daysinfo[monthNum == 1, Date], col = "lightblue", lty = 2) +
  geom_line(stat = "identity", size = 0.25) +
  theme_bw()

ggplot(fjm_visitors, aes(Date, visitors)) +
  geom_vline(xintercept = daysinfo[monthNum == 1, Date], col = "lightblue", lty = 2) +
  geom_line(stat = "identity", size = 0.25) +
  theme_bw() +
  coord_cartesian(xlim = as.Date(c("2016-01-01", "2016-12-31")), ylim = c(0, 1700))

ggplot(fjm_visitors, aes(Date, visitors)) +
  geom_vline(xintercept = daysinfo[monthNum == 1, Date], col = "lightblue", lty = 2) +
  geom_line(stat = "identity", size = 0.25) +
  theme_bw() +
  coord_cartesian(xlim = as.Date(c("2017-01-01", "2017-12-31")), ylim = c(0, 2200))

ggplot(fjm_visitors, aes(Date, visitors)) +
  geom_vline(xintercept = daysinfo[monthNum == 1, Date], col = "lightblue", lty = 2) +
  geom_line(stat = "identity", size = 0.25) +
  theme_bw() +
  coord_cartesian(xlim = as.Date(c("2018-01-01", "2018-12-31")), ylim = c(0, 4900))

# Showin moving average

ggplot(fjm_visitors, aes(Date, visitors)) +
  geom_vline(xintercept = daysinfo[monthNum == 1, Date], col = "lightblue", lty = 2) +
  geom_line(stat = "identity", size = 0.25) +
  geom_line(data = movingAverage(fjm_visitors), aes(Date, visitors), size = 0.5, col = "blue") +
  theme_bw()

ggplot(fjm_visitors, aes(Date, visitors)) +
  geom_vline(xintercept = daysinfo[monthNum == 1, Date], col = "lightblue", lty = 2) +
  geom_line(stat = "identity", size = 0.25) +
  geom_line(data = movingAverage(fjm_visitors), aes(Date, visitors), size = 0.5, col = "blue") +
  theme_bw() +
  coord_cartesian(xlim = as.Date(c("2016-01-01", "2016-12-31")), ylim = c(0, 1700))

ggplot(fjm_visitors, aes(Date, visitors)) +
  geom_vline(xintercept = daysinfo[monthNum == 1, Date], col = "lightblue", lty = 2) +
  geom_line(stat = "identity", size = 0.25) +
  geom_line(data = movingAverage(fjm_visitors), aes(Date, visitors), size = 0.5, col = "blue") +
  theme_bw() +
  coord_cartesian(xlim = as.Date(c("2017-01-01", "2017-12-31")), ylim = c(0, 2200))

ggplot(fjm_visitors, aes(Date, visitors)) +
  geom_vline(xintercept = daysinfo[monthNum == 1, Date], col = "lightblue", lty = 2) +
  geom_line(stat = "identity", size = 0.25) +
  geom_line(data = movingAverage(fjm_visitors), aes(Date, visitors), size = 0.5, col = "blue") +
  theme_bw() +
  coord_cartesian(xlim = as.Date(c("2018-01-01", "2018-12-31")), ylim = c(0, 4900))

# Show start and end dates for each dataset


# Correlation tests ====

teststart <- "2016-01-01"  # Values for Full Data
testend <- "2018-05-24"  # 31 days smaller than limit 2018-06-30
maxlag <- 31
visitordata <- fjm_visitors[Date >= teststart & Date <= as.Date(testend) + maxlag]

# --- All Website
rm(res, res01, res02, res03, res04, res05)
res01 <- getMaxCorrelationsTable(completeGADates(ga_allws_nochn_all[Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-All")
res02 <- getMaxCorrelationsTable(completeGADates(ga_allws_nochn_os[Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-OS")
res03 <- getMaxCorrelationsTable(completeGADates(ga_allws_nochn_es[Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-ES")
res04 <- getMaxCorrelationsTable(completeGADates(ga_allws_nochn_do[Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-DO")
res05 <- getMaxCorrelationsTable(completeGADates(ga_allws_nochn_lo[Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-LO")
res <- rbind(res01, res02, res03, res04, res05)

rm(res01, res02, res03, res04, res05, res06, res07, res08)
res01 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_all[Channel == "(Other)" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-All-(Others)")
res02 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_all[Channel == "Direct" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-All-Direct")
res03 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_all[Channel == "Display" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-All-Display")
res04 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_all[Channel == "Email" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-All-Email")
res05 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_all[Channel == "Organic Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-All-Organic Search")
res06 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_all[Channel == "Paid Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-All-Paid Search")
res07 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_all[Channel == "Referral" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-All-Referral")
res08 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_all[Channel == "Social" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-All-Social")
res <- rbind(res, res01, res02, res03, res04, res05, res06, res07, res08)

teststart <- "2016-08-04"  # Values for Full Data
testend <- "2018-05-24"  # 31 days smaller than limit 2018-06-30
maxlag <- 31
visitordata <- fjm_visitors[Date >= teststart & Date <= as.Date(testend) + maxlag]

rm(res01, res02, res03, res04, res05, res06, res07, res08)
res01 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_os[Channel == "(Other)" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-OS-(Others)")
res02 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_os[Channel == "Direct" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-OS-Direct")
res03 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_os[Channel == "Display" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-OS-Display")
res04 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_os[Channel == "Email" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-OS-Email")
res05 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_os[Channel == "Organic Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-OS-Organic Search")
res06 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_os[Channel == "Paid Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-OS-Paid Search")
res07 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_os[Channel == "Referral" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-OS-Referral")
res08 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_os[Channel == "Social" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-OS-Social")
res <- rbind(res, res01, res02, res03, res04, res05, res06, res07, res08)

rm(res01, res02, res03, res04, res05, res06, res07, res08)
res01 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_es[Channel == "(Other)" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-ES-(Others)")
res02 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_es[Channel == "Direct" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-ES-Direct")
res03 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_es[Channel == "Display" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-ES-Display")
res04 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_es[Channel == "Email" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-ES-Email")
res05 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_es[Channel == "Organic Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-ES-Organic Search")
res06 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_es[Channel == "Paid Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-ES-Paid Search")
res07 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_es[Channel == "Referral" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-ES-Referral")
res08 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_es[Channel == "Social" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-ES-Social")
res <- rbind(res, res01, res02, res03, res04, res05, res06, res07, res08)

rm(res01, res02, res03, res04, res05, res06, res07, res08)
res01 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_do[Channel == "(Other)" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-DO-(Others)")
res02 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_do[Channel == "Direct" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-DO-Direct")
res03 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_do[Channel == "Display" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-DO-Display")
res04 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_do[Channel == "Email" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-DO-Email")
res05 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_do[Channel == "Organic Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-DO-Organic Search")
res06 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_do[Channel == "Paid Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-DO-Paid Search")
res07 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_do[Channel == "Referral" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-DO-Referral")
res08 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_do[Channel == "Social" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-DO-Social")
res <- rbind(res, res01, res02, res03, res04, res05, res06, res07, res08)

rm(res01, res02, res03, res04, res05, res06, res07, res08)
res01 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_lo[Channel == "(Other)" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-LO-(Others)")
res02 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_lo[Channel == "Direct" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-LO-Direct")
res03 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_lo[Channel == "Display" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-LO-Display")
res04 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_lo[Channel == "Email" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-LO-Email")
res05 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_lo[Channel == "Organic Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-LO-Organic Search")
res06 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_lo[Channel == "Paid Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-LO-Paid Search")
res07 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_lo[Channel == "Referral" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-LO-Referral")
res08 <- getMaxCorrelationsTable(completeGADates(ga_allws_chn_lo[Channel == "Social" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "AllWS-LO-Social")
res <- rbind(res, res01, res02, res03, res04, res05, res06, res07, res08)

fwrite(res, file = "output/correlations_allws.csv")
fwrite(getBestCorrelations(res), file = "output/best_correlations_allws.csv")

# --- Arte (Art)
teststart <- "2016-01-01"  # Values for Full Data
testend <- "2018-05-24"  # 31 days smaller than limit 2018-06-30
maxlag <- 31
visitordata <- fjm_visitors[Date >= teststart & Date <= as.Date(testend) + maxlag]

rm(res, res01, res02, res03, res04, res05)
res01 <- getMaxCorrelationsTable(completeGADates(ga_arte_nochn_all[Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-All")
res02 <- getMaxCorrelationsTable(completeGADates(ga_arte_nochn_os[Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-OS")
res03 <- getMaxCorrelationsTable(completeGADates(ga_arte_nochn_es[Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-ES")
res04 <- getMaxCorrelationsTable(completeGADates(ga_arte_nochn_do[Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-DO")
res05 <- getMaxCorrelationsTable(completeGADates(ga_arte_nochn_lo[Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-LO")
res <- rbind(res01, res02, res03, res04, res05)

rm(res01, res02, res03, res04, res05, res06, res07, res08)
res01 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_all[Channel == "(Other)" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-All-(Others)")
res02 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_all[Channel == "Direct" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-All-Direct")
res03 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_all[Channel == "Display" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-All-Display")
res04 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_all[Channel == "Email" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-All-Email")
res05 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_all[Channel == "Organic Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-All-Organic Search")
res06 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_all[Channel == "Paid Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-All-Paid Search")
res07 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_all[Channel == "Referral" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-All-Referral")
res08 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_all[Channel == "Social" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-All-Social")
res <- rbind(res, res01, res02, res03, res04, res05, res06, res07, res08)

teststart <- "2016-08-04"  # Values for Full Data
testend <- "2018-05-24"  # 31 days smaller than limit 2018-06-30
maxlag <- 31
visitordata <- fjm_visitors[Date >= teststart & Date <= as.Date(testend) + maxlag]

rm(res01, res02, res03, res04, res05, res06, res07, res08)
res01 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_os[Channel == "(Other)" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-OS-(Others)")
res02 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_os[Channel == "Direct" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-OS-Direct")
res03 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_os[Channel == "Display" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-OS-Display")
res04 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_os[Channel == "Email" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-OS-Email")
res05 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_os[Channel == "Organic Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-OS-Organic Search")
res06 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_os[Channel == "Paid Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-OS-Paid Search")
res07 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_os[Channel == "Referral" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-OS-Referral")
res08 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_os[Channel == "Social" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-OS-Social")
res <- rbind(res, res01, res02, res03, res04, res05, res06, res07, res08)

rm(res01, res02, res03, res04, res05, res06, res07, res08)
res01 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_es[Channel == "(Other)" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-ES-(Others)")
res02 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_es[Channel == "Direct" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-ES-Direct")
res03 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_es[Channel == "Display" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-ES-Display")
res04 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_es[Channel == "Email" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-ES-Email")
res05 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_es[Channel == "Organic Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-ES-Organic Search")
res06 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_es[Channel == "Paid Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-ES-Paid Search")
res07 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_es[Channel == "Referral" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-ES-Referral")
res08 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_es[Channel == "Social" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-ES-Social")
res <- rbind(res, res01, res02, res03, res04, res05, res06, res07, res08)

rm(res01, res02, res03, res04, res05, res06, res07, res08)
res01 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_do[Channel == "(Other)" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-DO-(Others)")
res02 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_do[Channel == "Direct" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-DO-Direct")
res03 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_do[Channel == "Display" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-DO-Display")
res04 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_do[Channel == "Email" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-DO-Email")
res05 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_do[Channel == "Organic Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-DO-Organic Search")
res06 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_do[Channel == "Paid Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-DO-Paid Search")
res07 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_do[Channel == "Referral" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-DO-Referral")
res08 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_do[Channel == "Social" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-DO-Social")
res <- rbind(res, res01, res02, res03, res04, res05, res06, res07, res08)

rm(res01, res02, res03, res04, res05, res06, res07, res08)
res01 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_lo[Channel == "(Other)" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-LO-(Others)")
res02 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_lo[Channel == "Direct" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-LO-Direct")
res03 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_lo[Channel == "Display" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-LO-Display")
res04 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_lo[Channel == "Email" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-LO-Email")
res05 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_lo[Channel == "Organic Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-LO-Organic Search")
res06 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_lo[Channel == "Paid Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-LO-Paid Search")
res07 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_lo[Channel == "Referral" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-LO-Referral")
res08 <- getMaxCorrelationsTable(completeGADates(ga_arte_chn_lo[Channel == "Social" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ART-LO-Social")
res <- rbind(res, res01, res02, res03, res04, res05, res06, res07, res08)

fwrite(res, file = "output/correlations_arte.csv")
fwrite(getBestCorrelations(res), file = "output/best_correlations_arte.csv")


# --- Bibliotecas (Library)
teststart <- "2016-01-01"  # Values for Full Data
testend <- "2018-05-24"  # 31 days smaller than limit 2018-06-30
maxlag <- 31
visitordata <- fjm_visitors[Date >= teststart & Date <= as.Date(testend) + maxlag]

rm(res, res01, res02, res03, res04, res05)
res01 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_nochn_all[Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-All")
res02 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_nochn_os[Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-OS")
res03 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_nochn_es[Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-ES")
res04 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_nochn_do[Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-DO")
res05 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_nochn_lo[Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-LO")
res <- rbind(res01, res02, res03, res04, res05)

rm(res01, res02, res03, res04, res05, res06, res07, res08)
res01 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_all[Channel == "(Other)" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-All-(Others)")
res02 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_all[Channel == "Direct" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-All-Direct")
res03 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_all[Channel == "Display" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-All-Display")
res04 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_all[Channel == "Email" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-All-Email")
res05 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_all[Channel == "Organic Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-All-Organic Search")
res06 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_all[Channel == "Paid Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-All-Paid Search")
res07 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_all[Channel == "Referral" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-All-Referral")
res08 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_all[Channel == "Social" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-All-Social")
res <- rbind(res, res01, res02, res03, res04, res05, res06, res07, res08)

teststart <- "2016-08-04"  # Values for Full Data
testend <- "2018-05-24"  # 31 days smaller than limit 2018-06-30
maxlag <- 31
visitordata <- fjm_visitors[Date >= teststart & Date <= as.Date(testend) + maxlag]

rm(res01, res02, res03, res04, res05, res06, res07, res08)
res01 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_os[Channel == "(Other)" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-OS-(Others)")
res02 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_os[Channel == "Direct" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-OS-Direct")
res03 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_os[Channel == "Display" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-OS-Display")
res04 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_os[Channel == "Email" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-OS-Email")
res05 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_os[Channel == "Organic Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-OS-Organic Search")
res06 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_os[Channel == "Paid Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-OS-Paid Search")
res07 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_os[Channel == "Referral" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-OS-Referral")
res08 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_os[Channel == "Social" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-OS-Social")
res <- rbind(res, res01, res02, res03, res04, res05, res06, res07, res08)

rm(res01, res02, res03, res04, res05, res06, res07, res08)
res01 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_es[Channel == "(Other)" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-ES-(Others)")
res02 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_es[Channel == "Direct" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-ES-Direct")
res03 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_es[Channel == "Display" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-ES-Display")
res04 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_es[Channel == "Email" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-ES-Email")
res05 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_es[Channel == "Organic Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-ES-Organic Search")
res06 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_es[Channel == "Paid Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-ES-Paid Search")
res07 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_es[Channel == "Referral" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-ES-Referral")
res08 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_es[Channel == "Social" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-ES-Social")
res <- rbind(res, res01, res02, res03, res04, res05, res06, res07, res08)

rm(res01, res02, res03, res04, res05, res06, res07, res08)
res01 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_do[Channel == "(Other)" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-DO-(Others)")
res02 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_do[Channel == "Direct" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-DO-Direct")
res03 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_do[Channel == "Display" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-DO-Display")
res04 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_do[Channel == "Email" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-DO-Email")
res05 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_do[Channel == "Organic Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-DO-Organic Search")
res06 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_do[Channel == "Paid Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-DO-Paid Search")
res07 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_do[Channel == "Referral" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-DO-Referral")
res08 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_do[Channel == "Social" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-DO-Social")
res <- rbind(res, res01, res02, res03, res04, res05, res06, res07, res08)

rm(res01, res02, res03, res04, res05, res06, res07, res08)
res01 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_lo[Channel == "(Other)" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-LO-(Others)")
res02 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_lo[Channel == "Direct" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-LO-Direct")
res03 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_lo[Channel == "Display" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-LO-Display")
res04 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_lo[Channel == "Email" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-LO-Email")
res05 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_lo[Channel == "Organic Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-LO-Organic Search")
res06 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_lo[Channel == "Paid Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-LO-Paid Search")
res07 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_lo[Channel == "Referral" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-LO-Referral")
res08 <- getMaxCorrelationsTable(completeGADates(ga_bibliotecas_chn_lo[Channel == "Social" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LIB-LO-Social")
res <- rbind(res, res01, res02, res03, res04, res05, res06, res07, res08)

fwrite(res, file = "output/correlations_bibliotecas.csv")
fwrite(getBestCorrelations(res), file = "output/best_correlations_bibliotecas.csv")


# --- Conferencias (Lectures)
teststart <- "2016-01-01"  # Values for Full Data
testend <- "2018-05-24"  # 31 days smaller than limit 2018-06-30
maxlag <- 31
visitordata <- fjm_visitors[Date >= teststart & Date <= as.Date(testend) + maxlag]

rm(res, res01, res02, res03, res04, res05)
res01 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_nochn_all[Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-All")
res02 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_nochn_os[Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-OS")
res03 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_nochn_es[Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-ES")
res04 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_nochn_do[Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-DO")
res05 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_nochn_lo[Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-LO")
res <- rbind(res01, res02, res03, res04, res05)

rm(res01, res02, res03, res04, res05, res06, res07, res08)
res01 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_all[Channel == "(Other)" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-All-(Others)")
res02 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_all[Channel == "Direct" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-All-Direct")
res03 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_all[Channel == "Display" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-All-Display")
res04 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_all[Channel == "Email" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-All-Email")
res05 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_all[Channel == "Organic Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-All-Organic Search")
res06 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_all[Channel == "Paid Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-All-Paid Search")
res07 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_all[Channel == "Referral" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-All-Referral")
res08 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_all[Channel == "Social" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-All-Social")
res <- rbind(res, res01, res02, res03, res04, res05, res06, res07, res08)

teststart <- "2016-08-04"  # Values for Full Data
testend <- "2018-05-24"  # 31 days smaller than limit 2018-06-30
maxlag <- 31
visitordata <- fjm_visitors[Date >= teststart & Date <= as.Date(testend) + maxlag]

rm(res01, res02, res03, res04, res05, res06, res07, res08)
res01 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_os[Channel == "(Other)" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-OS-(Others)")
res02 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_os[Channel == "Direct" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-OS-Direct")
res03 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_os[Channel == "Display" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-OS-Display")
res04 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_os[Channel == "Email" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-OS-Email")
res05 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_os[Channel == "Organic Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-OS-Organic Search")
res06 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_os[Channel == "Paid Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-OS-Paid Search")
res07 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_os[Channel == "Referral" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-OS-Referral")
res08 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_os[Channel == "Social" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-OS-Social")
res <- rbind(res, res01, res02, res03, res04, res05, res06, res07, res08)

rm(res01, res02, res03, res04, res05, res06, res07, res08)
res01 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_es[Channel == "(Other)" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-ES-(Others)")
res02 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_es[Channel == "Direct" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-ES-Direct")
res03 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_es[Channel == "Display" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-ES-Display")
res04 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_es[Channel == "Email" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-ES-Email")
res05 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_es[Channel == "Organic Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-ES-Organic Search")
res06 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_es[Channel == "Paid Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-ES-Paid Search")
res07 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_es[Channel == "Referral" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-ES-Referral")
res08 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_es[Channel == "Social" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-ES-Social")
res <- rbind(res, res01, res02, res03, res04, res05, res06, res07, res08)

rm(res01, res02, res03, res04, res05, res06, res07, res08)
res01 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_do[Channel == "(Other)" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-DO-(Others)")
res02 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_do[Channel == "Direct" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-DO-Direct")
res03 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_do[Channel == "Display" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-DO-Display")
res04 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_do[Channel == "Email" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-DO-Email")
res05 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_do[Channel == "Organic Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-DO-Organic Search")
res06 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_do[Channel == "Paid Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-DO-Paid Search")
res07 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_do[Channel == "Referral" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-DO-Referral")
res08 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_do[Channel == "Social" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-DO-Social")
res <- rbind(res, res01, res02, res03, res04, res05, res06, res07, res08)

rm(res01, res02, res03, res04, res05, res06, res07, res08)
res01 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_lo[Channel == "(Other)" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-LO-(Others)")
res02 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_lo[Channel == "Direct" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-LO-Direct")
res03 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_lo[Channel == "Display" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-LO-Display")
res04 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_lo[Channel == "Email" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-LO-Email")
res05 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_lo[Channel == "Organic Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-LO-Organic Search")
res06 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_lo[Channel == "Paid Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-LO-Paid Search")
res07 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_lo[Channel == "Referral" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-LO-Referral")
res08 <- getMaxCorrelationsTable(completeGADates(ga_conferencias_chn_lo[Channel == "Social" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "LECT-LO-Social")
res <- rbind(res, res01, res02, res03, res04, res05, res06, res07, res08)

fwrite(res, file = "output/correlations_conferencias.csv")
fwrite(getBestCorrelations(res), file = "output/best_correlations_conferencias.csv")


# --- English site
teststart <- "2016-01-01"  # Values for Full Data
testend <- "2018-05-24"  # 31 days smaller than limit 2018-06-30
maxlag <- 31
visitordata <- fjm_visitors[Date >= teststart & Date <= as.Date(testend) + maxlag]

rm(res, res01, res02, res03, res04, res05)
res01 <- getMaxCorrelationsTable(completeGADates(ga_engws_nochn_all[Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-All")
res02 <- getMaxCorrelationsTable(completeGADates(ga_engws_nochn_os[Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-OS")
res03 <- getMaxCorrelationsTable(completeGADates(ga_engws_nochn_es[Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-ES")
res04 <- getMaxCorrelationsTable(completeGADates(ga_engws_nochn_do[Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-DO")
res05 <- getMaxCorrelationsTable(completeGADates(ga_engws_nochn_lo[Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-LO")
res <- rbind(res01, res02, res03, res04, res05)

rm(res01, res02, res03, res04, res05, res06, res07, res08)
res01 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_all[Channel == "(Other)" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-All-(Others)")
res02 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_all[Channel == "Direct" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-All-Direct")
res03 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_all[Channel == "Display" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-All-Display")
res04 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_all[Channel == "Email" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-All-Email")
res05 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_all[Channel == "Organic Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-All-Organic Search")
res06 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_all[Channel == "Paid Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-All-Paid Search")
res07 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_all[Channel == "Referral" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-All-Referral")
res08 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_all[Channel == "Social" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-All-Social")
res <- rbind(res, res01, res02, res03, res04, res05, res06, res07, res08)

teststart <- "2016-08-04"  # Values for Full Data
testend <- "2018-05-24"  # 31 days smaller than limit 2018-06-30
maxlag <- 31
visitordata <- fjm_visitors[Date >= teststart & Date <= as.Date(testend) + maxlag]

rm(res01, res02, res03, res04, res05, res06, res07, res08)
res01 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_os[Channel == "(Other)" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-OS-(Others)")
res02 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_os[Channel == "Direct" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-OS-Direct")
res03 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_os[Channel == "Display" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-OS-Display")
res04 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_os[Channel == "Email" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-OS-Email")
res05 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_os[Channel == "Organic Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-OS-Organic Search")
res06 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_os[Channel == "Paid Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-OS-Paid Search")
res07 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_os[Channel == "Referral" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-OS-Referral")
res08 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_os[Channel == "Social" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-OS-Social")
res <- rbind(res, res01, res02, res03, res04, res05, res06, res07, res08)

rm(res01, res02, res03, res04, res05, res06, res07, res08)
res01 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_es[Channel == "(Other)" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-ES-(Others)")
res02 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_es[Channel == "Direct" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-ES-Direct")
res03 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_es[Channel == "Display" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-ES-Display")
res04 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_es[Channel == "Email" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-ES-Email")
res05 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_es[Channel == "Organic Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-ES-Organic Search")
res06 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_es[Channel == "Paid Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-ES-Paid Search")
res07 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_es[Channel == "Referral" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-ES-Referral")
res08 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_es[Channel == "Social" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-ES-Social")
res <- rbind(res, res01, res02, res03, res04, res05, res06, res07, res08)

rm(res01, res02, res03, res04, res05, res06, res07, res08)
res01 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_do[Channel == "(Other)" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-DO-(Others)")
res02 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_do[Channel == "Direct" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-DO-Direct")
res03 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_do[Channel == "Display" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-DO-Display")
res04 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_do[Channel == "Email" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-DO-Email")
res05 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_do[Channel == "Organic Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-DO-Organic Search")
res06 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_do[Channel == "Paid Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-DO-Paid Search")
res07 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_do[Channel == "Referral" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-DO-Referral")
res08 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_do[Channel == "Social" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-DO-Social")
res <- rbind(res, res01, res02, res03, res04, res05, res06, res07, res08)

rm(res01, res02, res03, res04, res05, res06, res07, res08)
res01 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_lo[Channel == "(Other)" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-LO-(Others)")
res02 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_lo[Channel == "Direct" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-LO-Direct")
res03 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_lo[Channel == "Display" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-LO-Display")
res04 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_lo[Channel == "Email" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-LO-Email")
res05 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_lo[Channel == "Organic Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-LO-Organic Search")
res06 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_lo[Channel == "Paid Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-LO-Paid Search")
res07 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_lo[Channel == "Referral" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-LO-Referral")
res08 <- getMaxCorrelationsTable(completeGADates(ga_engws_chn_lo[Channel == "Social" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "ENGWS-LO-Social")
res <- rbind(res, res01, res02, res03, res04, res05, res06, res07, res08)

fwrite(res, file = "output/correlations_engws.csv")
fwrite(getBestCorrelations(res), file = "output/best_correlations_engws.csv")

# --- Musica (Music)
teststart <- "2016-01-01"  # Values for Full Data
testend <- "2018-05-24"  # 31 days smaller than limit 2018-06-30
maxlag <- 31
visitordata <- fjm_visitors[Date >= teststart & Date <= as.Date(testend) + maxlag]

rm(res, res01, res02, res03, res04, res05)
res01 <- getMaxCorrelationsTable(completeGADates(ga_musica_nochn_all[Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-All")
res02 <- getMaxCorrelationsTable(completeGADates(ga_musica_nochn_os[Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-OS")
res03 <- getMaxCorrelationsTable(completeGADates(ga_musica_nochn_es[Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-ES")
res04 <- getMaxCorrelationsTable(completeGADates(ga_musica_nochn_do[Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-DO")
res05 <- getMaxCorrelationsTable(completeGADates(ga_musica_nochn_lo[Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-LO")
res <- rbind(res01, res02, res03, res04, res05)

rm(res01, res02, res03, res04, res05, res06, res07, res08)
res01 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_all[Channel == "(Other)" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-All-(Others)")
res02 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_all[Channel == "Direct" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-All-Direct")
res03 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_all[Channel == "Display" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-All-Display")
res04 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_all[Channel == "Email" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-All-Email")
res05 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_all[Channel == "Organic Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-All-Organic Search")
res06 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_all[Channel == "Paid Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-All-Paid Search")
res07 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_all[Channel == "Referral" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-All-Referral")
res08 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_all[Channel == "Social" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-All-Social")
res <- rbind(res, res01, res02, res03, res04, res05, res06, res07, res08)

teststart <- "2016-08-04"  # Values for Full Data
testend <- "2018-05-24"  # 31 days smaller than limit 2018-06-30
maxlag <- 31
visitordata <- fjm_visitors[Date >= teststart & Date <= as.Date(testend) + maxlag]

rm(res01, res02, res03, res04, res05, res06, res07, res08)
res01 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_os[Channel == "(Other)" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-OS-(Others)")
res02 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_os[Channel == "Direct" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-OS-Direct")
res03 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_os[Channel == "Display" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-OS-Display")
res04 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_os[Channel == "Email" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-OS-Email")
res05 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_os[Channel == "Organic Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-OS-Organic Search")
res06 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_os[Channel == "Paid Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-OS-Paid Search")
res07 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_os[Channel == "Referral" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-OS-Referral")
res08 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_os[Channel == "Social" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-OS-Social")
res <- rbind(res, res01, res02, res03, res04, res05, res06, res07, res08)

rm(res01, res02, res03, res04, res05, res06, res07, res08)
res01 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_es[Channel == "(Other)" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-ES-(Others)")
res02 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_es[Channel == "Direct" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-ES-Direct")
res03 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_es[Channel == "Display" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-ES-Display")
res04 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_es[Channel == "Email" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-ES-Email")
res05 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_es[Channel == "Organic Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-ES-Organic Search")
res06 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_es[Channel == "Paid Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-ES-Paid Search")
res07 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_es[Channel == "Referral" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-ES-Referral")
res08 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_es[Channel == "Social" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-ES-Social")
res <- rbind(res, res01, res02, res03, res04, res05, res06, res07, res08)

rm(res01, res02, res03, res04, res05, res06, res07, res08)
res01 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_do[Channel == "(Other)" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-DO-(Others)")
res02 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_do[Channel == "Direct" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-DO-Direct")
res03 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_do[Channel == "Display" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-DO-Display")
res04 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_do[Channel == "Email" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-DO-Email")
res05 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_do[Channel == "Organic Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-DO-Organic Search")
res06 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_do[Channel == "Paid Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-DO-Paid Search")
res07 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_do[Channel == "Referral" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-DO-Referral")
res08 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_do[Channel == "Social" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-DO-Social")
res <- rbind(res, res01, res02, res03, res04, res05, res06, res07, res08)

rm(res01, res02, res03, res04, res05, res06, res07, res08)
res01 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_lo[Channel == "(Other)" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-LO-(Others)")
res02 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_lo[Channel == "Direct" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-LO-Direct")
res03 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_lo[Channel == "Display" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-LO-Display")
res04 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_lo[Channel == "Email" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-LO-Email")
res05 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_lo[Channel == "Organic Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-LO-Organic Search")
res06 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_lo[Channel == "Paid Search" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-LO-Paid Search")
res07 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_lo[Channel == "Referral" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-LO-Referral")
res08 <- getMaxCorrelationsTable(completeGADates(ga_musica_chn_lo[Channel == "Social" & Date >= teststart & Date <= testend], limitDates = c(teststart, testend)), visitordata, tptype = "MUSIC-LO-Social")
res <- rbind(res, res01, res02, res03, res04, res05, res06, res07, res08)

fwrite(res, file = "output/correlations_musica.csv")
fwrite(getBestCorrelations(res), file = "output/best_correlations_musica.csv")


plotLagComparisonv2(movingAverage(ga_allws_chn_us[Channel == "Organic Search"]),
                    movingAverage(visitordata),
                    plotstart = "2017-06-15",
                    plotend = "2017-12-31",
                    metric = "UniquePageviews",
                    dlag = 1)

plotLagComparisonv2(ga_allws_chn_us[Channel == "Organic Search"],
                    visitordata,
                    plotstart = "2017-06-15",
                    plotend = "2017-12-31",
                    metric = "UniquePageviews",
                    dlag = 1)
