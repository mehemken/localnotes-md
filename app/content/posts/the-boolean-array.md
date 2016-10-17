title: Boolean indexing with numpy
display_date: October 10, 2016
sort_date: 20161010
full_date: Mon Oct 10 19:36:31 PDT 2016
tags: none

##How to use a boolean array

In playing around with numpy I discovered a cool little trick for using a boolean index to sort through some data (Credit to Wes McKinney in Python for Data Analysis). Let's say you have a few names.

    :::python
    In [1]: import numpy as np

    In [2]: names = np.array([ 'foo', 'bar', 'baz', 
        'spam', 'bar', 'spam', 'foo', 'foo', 'spam' ])

    In [3]: names
    Out[3]: 
    array(['foo', 'bar', 'baz', 'spam', 'bar',
        'spam', 'foo', 'foo', 'spam'], dtype='<U4')

And let's say you also have some data.

    :::python
    In [4]: data = np.random.randn(9,5)

    In [5]: data
    Out[5]: 
    array([[ 1.17730138, -1.15560817, -1.25659869,  0.132735  ,  0.60257527],
           [ 0.14646268,  0.44489941,  0.35693771,  0.09595678,  0.62632031],
           [ 0.90563193, -0.39953054, -0.05751752,  0.26000591, -1.80731413],
           [-0.67112146, -0.41264341,  0.71890415,  0.34607695, -0.7698768 ],
           [ 0.20042628,  1.20705686, -0.26123606,  0.32278887, -0.13399535],
           [ 1.45226802,  0.13222381, -1.48520794,  1.83030424,  1.60516558],
           [ 0.80937063, -1.32259217, -0.1790453 ,  0.64613596,  3.4099514 ],
           [ 1.31424207,  1.22302042, -0.52483808,  0.19505955, -0.37940399],
           [ 1.606175  ,  1.00357798, -2.57493356,  0.01019173, -1.91751078]])

It just so happens that this data is directly related to the list of names. We have nine names (count them) and nine rows of data. On this particular day I just want to use the data from all the 'foo's. Well, this sounds like a job for boolean indexing. First we need a boolean array with adequate dimensions.

    :::python
    In [6]: names == 'foo'
    Out[6]: array([ True, False, False, False,
        False, False,  True,  True, False], dtype=bool)

Great. Now we just select the data based on this array.

    :::python
    In [7]: data[names == 'foo']
    Out[7]: 
    array([[ 1.17730138, -1.15560817, -1.25659869,  0.132735  ,  0.60257527],
           [ 0.80937063, -1.32259217, -0.1790453 ,  0.64613596,  3.4099514 ],
           [ 1.31424207,  1.22302042, -0.52483808,  0.19505955, -0.37940399]])

That's nice. But I only want to see the middle column.

    :::python
    In [8]: data[names == 'foo', 2:3]
    Out[8]: 
    array([[-1.25659869],
           [-0.1790453 ],
           [-0.52483808]])

My mistake I need this for all the 'spam's not the 'foo's.

    :::python
    In [9]: data[names == 'spam', 2:3]
    Out[9]: 
    array([[ 0.71890415],
           [-1.48520794],
           [-2.57493356]])

And there you have it ladies and gentlemen. Numpy has done all the work and we can go have a coffee.
