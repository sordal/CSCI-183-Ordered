__author__ = 'SamuelKelly'
#After being kind of lost for a bit I did a little digging because I'm not to good with python and found http://keras.io/
#they had some simple instructions on how to make simple layers of neural network
from keras.layers.core import Dense, Activation, Dropout
from keras.utils import np_utils #from keras.io
from keras.models import Sequential #see above
import pandas as pd #library used in titanic tutorial as well
import numpy as np # also from titanic python tutorial
# This didnt work at all for reading in
#def convert(y):
#rows, cols = sh(y)
#nlabel = len(unique(Y))
#y2 = zeros((rows, numLabels))
#for i in range(0, rows):
#y2[i, Y[i]] = 1
train = pd.read_csv('~/Desktop/ThirdKaggle/train.csv') #how to actually read in .csv file in python
labels = train.ix[:,0].values.astype('int32')
train1 = (train.ix[:,1:].values).astype('float32')
test1 = (pd.read_csv('~/Desktop/ThirdKaggle/test.csv').values).astype('float32')
train_b = np_utils.to_categorical(labels) #trying to convert the labels in the file to binary matrix
dimension_input = train1.shape[1]
classes = train_b.shape[1]
scale = np.max(train1) #here were trying to divide by the max and eventually subtract the mean
train1 /= scale #dividing
test1 /= scale  #dividing
mean = np.std(train1) #establishing the mean
train1 -= mean #subtracting the mean
test1 -= mean #subtracting the mean
#looked up how to do a simple forward feeding neural network thing for this competition
neuralnetwork = Sequential() #using the sequential function from import
neuralnetwork.add(Dense(dimension_input, 256, init='lecun_uniform'))
neuralnetwork.add(Activation('relu'))
#neuralnetwork.append(DataLayer(nout=256)) #doesnt work
#neuralnetwork.append(Layer(nout=256, activation=RectLin())) #doesntwork
#neuralnetwork.append((nout=256, activation=Logistic())) #doesnt work
neuralnetwork.add(Dropout(0.2))
neuralnetwork.add(Dense(256, 256, init='lecun_uniform'))
neuralnetwork.add(Activation('relu'))
neuralnetwork.add(Dropout(0.2))
neuralnetwork.add(Dense(256, classes, init='lecun_uniform'))
neuralnetwork.add(Activation('relu'))
neuralnetwork.compile(loss='mse', optimizer='rmsprop') #mean squared error helps account for loss and RMSprop is an optimizer
neuralnetwork.fit(train1, train_b, nb_epoch=10, batch_size=16, validation_split=0.1, show_accuracy=True, verbose=2) #fits the model
prediction = neuralnetwork.predict_classes(test1, verbose=0) #makes prediction
def create_csv(prediction, fname): #writing .csv file for submission
    pd.DataFrame({"ImageId": list(range(1,len(prediction)+1)), "Label": prediction}).to_csv(fname, index=False, header=True)
create_csv(prediction, "sumbmission1") #creating .csv