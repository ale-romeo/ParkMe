import random

print("INSERT INTO `Parking_Space` (`id`, `STATUS`, `charging_station`) VALUES")
zones = list("ABCDE")
for _ in range(0, 5):
    zone = zones[_]
    for a in range(0, 200):
        print("('"+zone+str(a)+"', 'Available', '"+str(random.randint(0,1))+"'),")