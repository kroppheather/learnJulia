import Pkg; Pkg.add("CSV")
import Pkg; Pkg.add("DataFrames")
import Pkg; Pkg.add("StatsPlots")

using CSV
using DataFrames
using StatsPlots

vari = 1 + 3
#example of downloading csv
Dat = download("https://github.com/kroppheather/learnJulia/blob/main/net_rad.csv", "net_rad.csv")
rad = CSV.read("net_rad.csv", DataFrame)
#read in csv from computer
flux = CSV.read("/Users/hkropp/Google Drive/research/projects/Healy_ET/healy_flux/fluxes/data/07_2018.csv", DataFrame)
#noaa weather
weath = CSV.read("/Users/hkropp/Google Drive/teaching/2020/Fall 2020/EnvDataSci/activity/data/activity 5/noaa2011124.csv",DataFrame;header=true,missingstring="NA")

@show typeof(rad)
@show typeof(test)
#subset
flux[1:2,:]

flux[1:2,15]

#make a DataFrame from vectors
mtns = ["Everest", "K2", "Kangchenjunga", "Lhotse", "Makalu"]
hts = [8848,8611,8586,8516,8485]
prom = [8848,4020,3922,610,2378]
df_ht = DataFrame(mount = mtns, elev = hts)
df_pr = DataFrame(mount = mtns, prom = prom)

#join DataFrames
mountains = innerjoin(df_ht,df_pr, on=:mount)

#summary stats
describe(flux)
describe(rad)
describe(weath)
#plot
scatter(prom,hts, xlabel="Prominence (m)",ylabel="Elevation (m)", legend=false)



scatter(weath[!,:"TMAX"])