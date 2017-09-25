Processing Steps
----------------

 

-   Read the data into appropriate variables

-   Bind the test and training data into their respective variables

-   Merge the Subject, Activity and Feature data sets into a single data set

-   Apply column names to the data set

-   Extract out mean, std, activity and subject columns

-   Fix any column names that need to be altered to be human understandable

-   Create average (mean) of the data set into a smaller data variable

-   Save aggregate data set to file

 

Vars
----

-   s_train, s_test = subject train and test from file

-   a_train, a_test = activity train and test from file

-   f_train, f_test = feature train and test from file

-    

-   s_data = s_train + s_test

-   a_data = a_train + a_test

-   f_data = f_train + f_test

-    

-   Data = s_data + a_data + f_data

-   Data2 = aggregate smaller mean data of Data

 

 

 
