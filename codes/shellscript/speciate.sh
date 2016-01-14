#!/usr/bin

# requisito
# baixar tabela: http://www3.epa.gov/ttnchie1/software/speciate/
# http://www.epa.gov/ttn/chief/software/speciate/speciate4/speciate4_4_final.zip
# apt-get install mdbtools

# Para ver as tabelas:
mdb-tables SPECIATE4.4.mdb

# Tabelas que me interessam:
mdb-export SPECIATE4.4.mdb GAS_PROFILE > GAS_PROFILE.csv
mdb-export SPECIATE4.4.mdb GAS_SPECIES > GAS_SPECIES.csv
mdb-export SPECIATE4.4.mdb "List of SVOC Splitting Factors" > SVOC.csv
mdb-export SPECIATE4.4.mdb MNEMONIC > MNEMONIC.csv
mdb-export SPECIATE4.4.mdb "OTHER GASES_PROFILE" > OTHER_GASES_PROFILE.csv
mdb-export SPECIATE4.4.mdb "OTHER GASES_SPECIES" > OTHER_GASES_SPECIES.csv
mdb-export SPECIATE4.4.mdb PM_PROFILE > PM_PROFILE.csv
mdb-export SPECIATE4.4.mdb PM_SPECIES > PM_SPECIES.csv
mdb-export SPECIATE4.4.mdb REFERENCE > REFERENCE.csv
mdb-export SPECIATE4.4.mdb REVISION_LIST > REVISION_LIST.csv
mdb-export SPECIATE4.4.mdb SPECIES_PROPERTIES > SPECIES_PROPERTIES.csv
mdb-export SPECIATE4.4.mdb KEYWORD > KEYWORD.csv


