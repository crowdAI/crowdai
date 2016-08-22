#!/usr/bin/env python


training = open("training.csv", "r")

count = 0
correct = 0

_d = {}

labels = "per_hundred	per_portion	percent".split()

for _line in training.readlines()[1:]:
    _entries = _line.strip().split(",")
    if len(_entries) != 5:
        continue
    else:
        def _replace(x):
            temp = []
            for _x in x:
                if _x == '':
                    temp.append(-1)
                else:
                    temp.append(float(_x))
            return temp


        filtered = _replace(_entries)

        _key = str(int(filtered[0]))+"_"+str(int(filtered[1]))+"_"

        vals = filtered[-3:]

        for idx, val in enumerate(vals):
            _d[_key+labels[idx]] = val

        correct += vals.count(-1)
        count += len(vals)

print "-1s : ", correct
print "Total : ", count

print "Percentage : ", correct*1.0/count

print len(sorted(_d.keys()))
