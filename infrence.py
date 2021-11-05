import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.patches import Ellipse

units = pd.read_csv('units_train_adc0.csv').values[:,1:]
print(units.shape)
data = pd.read_csv('dcp/feature_pool_train.csv').values[:,1:]
label = data[:,-1]
data = data[:,:-1]
print(data.shape)
test = pd.read_csv('dcp/feature_pool_test.csv').values[:,1:]
label_test = test[:,-1]
test = test[:,:-1]

proj1 = np.matmul(data, units[:,0])
print(proj1[0])
proj2 = np.matmul(data, units[:,1])
print(proj2.shape)

projt1 = np.matmul(test, units[:,0])
projt2 = np.matmul(test, units[:,1])

pos = np.where(label==1)[0]
neg = np.where(label==0)[0]

ax = plt.gca()
plt.scatter(proj1[pos], proj2[pos], marker='.', color='red', label='FOG+')
plt.scatter(proj1[neg], proj2[neg], marker='.', color='black', label='FOG-')

plt.scatter(projt1[np.where(label_test==1)[0]], projt2[np.where(label_test==1)[0]], marker='+', color='pink', label='FOG+ test')
plt.scatter(projt1[np.where(label_test==0)[0]], projt2[np.where(label_test==0)[0]], marker='+', color='blue', label='FOG- test')
#plt.plot([676.2,676.2],[106,115], color='green')
ax.add_patch(Ellipse(xy=(-2493.5, -434.5), width=7, height=10, edgecolor='g', fc='None', lw=1))
plt.legend(loc="upper left")
plt.xlabel("adc 1")
plt.ylabel("adc 2")
plt.savefig('fig.png')
plt.show()
