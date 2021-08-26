----------------------------------------------------------------------


Hi Krzysztof,
To give you an overview:



The BachelorFinal.RMD file is my main R File that also includes data preprocessing and clustering for the states.
 Based on that file I build my state model with the StateModel.RMD file.

The CountyModel file is a separate file for the County Model. 
And the CountyBusiness is the file that clusters the states based on the  County Business Pattern.

Additionally, before I opened the data in R I used SQLite to roughly preprocess the big data files and merge them.
