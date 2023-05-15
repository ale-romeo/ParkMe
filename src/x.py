import random

print("INSERT INTO `Parking_Space` (`id`, `STATUS`, `charging_station`) VALUES")
zones = list("ABCDE")
for _ in range(0, 5):
    zone = zones[_]
    for a in range(0, 200):
        print("('"+zone+str(a)+"', 'Available', '"+str(random.randint(0,1))+"'),")

payment diventano 2 tabelle,
reservation torna da cambiare relazioni che diventano request e afference così come nelle altre due tabelle di pagamento,
generalizzazione toglierla,
afference divetnao refer
reservation avrà anche i dati di pagamento,
zone add attribute lista di vie, comune
pagamento aggiorna parcheggio,
aumento prezzo prenotazione,