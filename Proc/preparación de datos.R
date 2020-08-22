pacman::p_load(dplyr, #manipulacion de datos
               readxl) #abrir base xls

#se abren datos originales
SIMCE <- read_excel("./Input/data/Datos originales/simce2m2013_regionXIII.xls")

#se seleccionan variables a usar
SIMCE_1 <- select(SIMCE, DDCIA, GRUPO, PROM_LECT, PROM_MAT)

#se recodifica la variable DDCIA
SIMCE_1 <- mutate(SIMCE_1, DDCIA.rec = recode(SIMCE_1$DDCIA, "PP" = "PP", "MD" = "M", "MC" = "M", "CP" = "PS", "PS" = "PS"))

#se recodifican categorías de respuesta de variable GRUPO y DDCIA
SIMCE_1$GRUPO=factor(SIMCE_1$GRUPO, levels=(c("Bajo", "Medio Bajo", "Medio", "Medio Alto", "Alto")), labels = (c("1", "2", "3", "4", "5")))
SIMCE_1$DDCIA.rec=factor(SIMCE_1$DDCIA.rec, levels=(c("M", "PS", "PP")), labels = (c("0", "1", "2")))

#se guarda base de datos procesada
save(SIMCE_1, file = "./Input/data/Datos procesados/SIMCE_1.RData")
