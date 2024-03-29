# AutogeneratedCodeDetection

Auto Generated Code Detection

The purpose of this module is to traverse throught the given repository and list out files to categorize them as code, config, data ,autogenerated, audio, video files. 
Post this we need to analyze the code files to determine whether it is an autogenerated file or not. Such demarkatkon of Suspecting a file as autogenereated code file will help exclude the file form further processing like sonar code review.

This shall benifit in the following ways:
1. Reduce Noise 
2. Faster processing
3. Exclude unnecessary processing of such files

We will mark the code files as 'Autogenerated Suspect/Support' based on follwing features:
1. Size of file > 500 kb
2. 100 % churn
3. One time big commit with no further changes
4. Less than 5% change in last one year
5. Path
6. Name
7. Read the first top 10 lines in file to find any comments mentioning the file is autogenerated
Each feature will be scored between 0-1. A data analysis model will run to analyze all the features and predict if the code is autogenerated or not.



#################################################################################################################################################################

Initial Queries: 

-Agenda: Detection of Auto Generated Files:

1. Why - Autogenerated files should not be processed by sonarqube as it hangs or takes more time for processing.
2. Why there are issues with sonarqube: - Need inputs from Ratnesh
	- Is Size high
	- Is code redundunt?
3. Which projects have faced issus? can we get the files which sonarqube was not able to process and were found autogenerated.	


Observations :

1. File names are same and extensions change. So in a repo having files with similar file names but diffent extensions can be marked for auto generated file analysis.
2.1 The churn might not always be high as a change in a line in typescrypt impacted only a change in single line.
2.2 All autogenerated files might not start with comment
2.3 All autogenerated file size might not be high
2.4 Large autogenerated files can be saved in chunks due to which size might not always be a correct indicator
2.5 Code Files Committed only once can be a suspect?
2.6 In case the churn is high (>.08) and no of commits are more than one can be a suspect for autogenerated code. Users can be asked for validation if it is autogerenated file for learning purposes which will be restricted for a given project.
2.7 Different extensions with same filenames which can be in same or different directory can be a suspect for autogenerated code.
2.8 Comments found between the code when written by humnas. Line Spacing differs.

Planned Strategies:

1. Need to list down all the languages and technology used - Need Ratnesh's Help
2. Need to study the autogenerated files for each technology, their pattern and behaviour. 
4. Need to develop strategy language/technoloty wise. 
eg : 
    1. Typescript:
      .ts files are written by humans which is compiled to create .js files. The .js files are created in the same directory as .ts files and their file name is same and the size is similar too. So .ts files .js files are autogenerated for sure. T
      
    2. Java:
    
    .java files are compled to .class files with simialar names.

