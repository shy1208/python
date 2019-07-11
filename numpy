1
import numpy as np
t1=np.array([1,2,3])
print(t1)

print(type(t1))
[1 2 3]
<class 'numpy.ndarray'>
2
t2=np.array(range(10))
print(t2)
print(type(t2))
[0 1 2 3 4 5 6 7 8 9]
<class 'numpy.ndarray'>
4
t3=np.arange(10)
print(t3)
print(type(t3))
[0 1 2 3 4 5 6 7 8 9]
<class 'numpy.ndarray'>
np.arange是numpy中的自带的range()功能的方法
5
print(t3.dtype)
int32
13
t4=np.arange(4,10,2)
print(t4)
print(t4.dtype)
t11=t4.transpose()
print(t11)
[4 6 8]
int32
[4 6 8]
32位电脑就显示int32，可我电脑是64啊，先留疑
7
t5=np.array([1,1,3,3,4,2],dtype=bool)
print(t5)
print(t5.dtype)
[ True  True  True  True  True  True]
bool
指定数据类型，上边的例子是指定了bool型，当然 也可以 指定 为Int型,float型
11
import random
t7=np.array([random.random() for i in range(10)])
print(t7)
print(t7.dtype)
[0.54049361 0.74710738 0.99011254 0.42953904 0.2910269  0.21989752
 0.44981317 0.28160878 0.96960171 0.37018928]
float64
ranadom.random()返回小数
轴axis，在numpy中可以理解为方向，使用0,1,2。。。 数字表示0表示横轴，1表示竖轴，这是二维数组的时候， 在三维数组的时候，0表示块的方向，1表示横，2表示竖 数组的原点都在左上角
numpy读取数据 csv：comma-separated value,以逗号分隔值 文件 显示：表格状态 np.loadtxt(frame.dtype=np.float,delimiter=None,skiprws=0,usecols=None,unpack=False) 各参数含义： frame 文件、字符串或产生器，可以是gz\bz2压缩文件 dtype 数据类型，可选，csv的字符串以什么数据类型读入数组中，默认np.flaot delimiter 分隔字符串，默认是任何空格，改为逗号 skiprows 路过前x行，一般路过第一行表头 usecols 读取指定 的列，索引，元组类型 unpack 如果True 读入属性将分别 写入不同数组变量，False读入数据只写入一个数组变量默认False
14
a1=np.arange(48)
No output
23
print(a1)
[ 0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23
 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47]
用np.arange()方法新建一个含有48个数的数组
24
a1.reshape(8,6)
24
array([[ 0,  1,  2,  3,  4,  5],
       [ 6,  7,  8,  9, 10, 11],
       [12, 13, 14, 15, 16, 17],
       [18, 19, 20, 21, 22, 23],
       [24, 25, 26, 27, 28, 29],
       [30, 31, 32, 33, 34, 35],
       [36, 37, 38, 39, 40, 41],
       [42, 43, 44, 45, 46, 47]])
通过np.reshape()来重新设置数组结构，并赋值给a2，由一维变为二维，下方可见
18
a2=a1.reshape(8,6)
print(a2)
[[ 0  1  2  3  4  5]
 [ 6  7  8  9 10 11]
 [12 13 14 15 16 17]
 [18 19 20 21 22 23]
 [24 25 26 27 28 29]
 [30 31 32 33 34 35]
 [36 37 38 39 40 41]
 [42 43 44 45 46 47]]
25
print(a2[2])
[12 13 14 15 16 17]
这里就是numpy里的切片功能，上边例子中是截取第三行数据
31
print(a2[[1,2,4]])
[[ 6  7  8  9 10 11]
 [12 13 14 15 16 17]
 [24 25 26 27 28 29]]
截取2，3，5行 因为Python是从0开始计数的
32
print(a2[[1,2,4],:])
[[ 6  7  8  9 10 11]
 [12 13 14 15 16 17]
 [24 25 26 27 28 29]]
同样是截取2，3，5行数据，这是按照普遍适用的写法来写的 print(a2[行，列])的形式来写的，比如print(a2[:,[1,2])表示行全要，列只要2和3列， print(a2[[1,2,4],:])表示列全要，但只要2，3，5行的内容
33
print(a2[2:5,1:3])
[[13 14]
 [19 20]
 [25 26]]
上例中显示结果为，第3，4，5行与第2，3列的结果，a2后的方括号里逗号前后分别代表行与列，用冒号来表示一个行的List,列的list，而python中都是左闭右开的，所以有如是的结果显示 行和列交叉点位置的数据
37
print(a2[[2,3],[1,4]])

[13 22]
这里的结果为：第3行第2列，与第4行第5列
36
print(a2[[2,3],[1,4，5]])
  File "<ipython-input-36-a9a63221752c>", line 1
    print(a2[[2,3],[1,4，5]])
                        ^
SyntaxError: invalid character in identifier

对比以上两个结果可知，这样不连续的进行截取，需要行与列数量完全匹配才能取到相应的数据，否则会报错
42
a2[a2<10]=99
print(a2)
[[99 99 99 99 99 99]
 [99 99 99 99 10 11]
 [12 13 14 15 16 17]
 [18 19 20 21 22 23]
 [24 25 26 27 28 29]
 [30 31 32 33 34 35]
 [36 37 38 39 40 41]
 [42 43 44 45 46 47]]
将a2中小于10的改为99
41
print(a2<20)
a2
[[False False False False False False]
 [False False False False  True  True]
 [ True  True  True  True  True  True]
 [ True  True False False False False]
 [False False False False False False]
 [False False False False False False]
 [False False False False False False]
 [False False False False False False]]
41
array([[99, 99, 99, 99, 99, 99],
       [99, 99, 99, 99, 10, 11],
       [12, 13, 14, 15, 16, 17],
       [18, 19, 20, 21, 22, 23],
       [24, 25, 26, 27, 28, 29],
       [30, 31, 32, 33, 34, 35],
       [36, 37, 38, 39, 40, 41],
       [42, 43, 44, 45, 46, 47]])
44
a3=np.where(a2<20,0,100)
print(a3)
[[100 100 100 100 100 100]
 [100 100 100 100   0   0]
 [  0   0   0   0   0   0]
 [  0   0 100 100 100 100]
 [100 100 100 100 100 100]
 [100 100 100 100 100 100]
 [100 100 100 100 100 100]
 [100 100 100 100 100 100]]
np.where()用法，参照上例：可知，当a2<20时，赋值为0 其它赋值为100
45
a3.clip(50,80)
45
array([[80, 80, 80, 80, 80, 80],
       [80, 80, 80, 80, 50, 50],
       [50, 50, 50, 50, 50, 50],
       [50, 50, 80, 80, 80, 80],
       [80, 80, 80, 80, 80, 80],
       [80, 80, 80, 80, 80, 80],
       [80, 80, 80, 80, 80, 80],
       [80, 80, 80, 80, 80, 80]])
clip（裁剪），名字好像不是太恰当 功能是将a3中小于50的换成50，大于80的换成80 要注意
