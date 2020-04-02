# Python 2.7
# Run Blodgett model on Founta et al.
import twokenize, predict
import csv
from numpy import array

predict.load_model()

if __name__ == '__main__':
    data = []
    with open("data/founta_et_al.csv") as file:
        rdr = csv.reader(file, delimiter=',')
        for row in rdr:
            id = row[0]
            text = row[1]
            label = row[2]
            annotations = predict.predict(twokenize.tokenize(text.decode("utf-8")))
            try:
                data.append([id, text, label]+list(annotations))
            except:
                data.append([id, text, label, -9, -9, -9, -9])

    with open('data/founta_race_annotated.csv', 'a') as resultsfile:
        fieldnames = ['id', 'text', 'label', 'afam', 'hisp', 'asian', 'white']
        writer = csv.writer(resultsfile, lineterminator='\n')
        writer.writerows([fieldnames])
        for row in data[1:]:
            writer.writerows([row])
