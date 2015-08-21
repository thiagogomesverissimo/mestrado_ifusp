rm(list=ls())
source("myfunctions/load.R")

# profiles
profiles <-  pmf_profiles('../../inputs/pmf/JFcH_profiles.csv')
species  <- profiles$fp_percent_species
 # fp_conc_species
species[species<=0.1] = ''
species

species[order(species$Factor.1,species$Factor.2,species$Factor.3,decreasing = T),]

cores <- rainbow(nrow(species))

pie(species$Factor.1,
    col=cores,
    labels = '',
    radius = 1, 
    cex = 0.3,
    main="Perfis")

legend("bottom", 
       row.names(species), 
       cex=0.8,
       horiz=T,
       fill=cores)

pie3D(species$Factor.1,
      explode=0.1,
      col=cores,
      main="Pie Chart of Countries ")

legend("topright", row.names(species), cex=0.8,fill=cores)


print(species,cutoff=1e-1)
print(loadings(species))

# Contributions
contributions <-  pmf_contributions('../../inputs/pmf/JFcH_contributions.csv')
factor_contribution = contributions$factor_contribution
plot(factor_contribution$`Factor 1`)

# Diagnostics
diagnostics <-  pmf_diagnostics('../../inputs/pmf/JFcH_diagnostics.csv')
Q = diagnostics$Q
d = diagnostics$d
D = diagnostics$D
plot(Q$Q.Robust.)

# residuals
residuals <- pmf_residuals('../../inputs/pmf/RFsH_residuals.csv')
residuals <- residuals$scaled_residuals
hist(residuals$Na)
hist(residuals$Rb)
hist(residuals$Fe)
