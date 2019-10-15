from matplotlib import pyplot as plt
import numpy as np

points = [
    (1,7), (5,5), 
    (1,8), (4,7),
    (2,9), (6,7),
    (2,11), (5,10),
    (3,11), (7,9),
    (1,12), (8,9),
    (1,13), (7,11),
    (4,13), (8,11),
    (2,14), (10,10),
    (3,14), (6,13), 
    (5,14), (10,11)
]

r_squares = [50,65,85,125,130,145,170,185,200,205,221]

x = list(map(lambda x: x[1], points))
y = list(map(lambda x: x[0], points))

# move x axis ticks/labels to the top
plt.rcParams['xtick.bottom'] = plt.rcParams['xtick.labelbottom'] = False
plt.rcParams['xtick.top'] = plt.rcParams['xtick.labeltop'] = True

# set axis limits; change direction of y axis
axes = plt.gca()
axes.set_xlim([0,15])
axes.set_ylim([0,15])
axes.invert_yaxis()
plt.axes().set_aspect('equal')



#def my_circle(lst,r): 
#    result = lambda x: x.upper()    

# draw dashed line
plt.plot(np.arange(0,15,1), np.arange(0,15,1), 'g--', lw=0.5)


for rr in r_squares:
    #print("r = %d" % r)
    xx = np.arange(np.sqrt(rr)/np.sqrt(2), np.sqrt(rr) + 0.01, 0.01)
    #print("xx = %s" % xx)
    plt.plot(xx, list(map(lambda x: np.sqrt(rr - x*x), xx)),'b', lw=1)

plt.rc('grid', linestyle="-", color='black')
#plt.scatter(x, y)
plt.plot(x, y, 'ro')
plt.grid(True)

#plt.show()

#plt.savefig('foo.png', bbox_inches='tight')
plt.savefig('vo_1985_9_5_01.png', bbox_inches='tight')

