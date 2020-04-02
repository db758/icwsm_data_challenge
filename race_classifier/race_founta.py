## Python 2.7
# Run Blodgett model on Founta et al.
# For necessary files see https://github.com/slanglab/twitteraae

import twokenize, predict
import csv
from numpy import array

predict.load_model()

if __name__ == '__main__':
    data = []
    with open("../raw_data/hatespeech_text_label_vote_RESTRICTED_100K.csv") as file:
        rdr = csv.reader(file, delimiter='\t')
        for row in rdr:
            #id = row[0]
            text = row[0]
            label = row[1]
            annotations = predict.predict(twokenize.tokenize(text.decode("utf-8")))
            try:
                data.append([text, label]+list(annotations))
            except:
                data.append([text, label, -9, -9, -9, -9])

    with open('data/founta_race_annotated.csv', 'a') as resultsfile:
        fieldnames = ['text', 'label', 'afam', 'hisp', 'asian', 'white']
        writer = csv.writer(resultsfile, lineterminator='\n')
        writer.writerows([fieldnames])
        for row in data:
            writer.writerows([row])

