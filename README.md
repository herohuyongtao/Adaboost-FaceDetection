Group project - CV @ UNO - Spring 2013-
Matthew Farmer
Devin Villegas

HOW TO RUN THIS CODE:

Features are created by the following scripts:
    A - HorizontalHaar
    B - VerticalHaar
    C - ThreeRectHaar
    D - FourRectHaar

    Reverse Polarity Features are created by fVec.*-1

Images are loaded by:
    ReadTestImages
    ReadTrainImages
    
Three ways of calculating error:
    Iteratively - naive functions (These are bad, included for analysis)
    Viola & Jones vectorized - This is done with vJErrorCalc
    Alsamman vectorized - separatedErrorCalcFunc
    These produce a 'threshold' matrix of Nx5
        nx1 - polarity ( representing which direction threshold takes )
        2 - Minimized error
        3 - value of the threshold 
        4 - face recognition error 
        5 - non-face rejection error

    We can calculate error with functions (for processing via adaboost) or with
    a script, which was used to perform the profiling.

Test images:
    We completed most (not all) of the code to do testing, but did not finish the report in time
    to include it

    RunFvecTestSet is a script which uses the Classifier struct (top x features)
        then runs it through the fVecImgAnalyze function.  Has not been
        modularized to handle any type of feature

Data Analysis:
    Done with mapTopClass - passing in the indices of the top scoring features
    The scripts we ran are DataAnalysisVJ & DrA

Scale Testing:
    Done with RatioTesting.m
    scaleImgs.m
    scaleFvecImgAnalyze
    testingRatioCodeResults.m

Utility Functions-
    showFeature - Takes an fvec and the index of feature - displays feature
        with Imagesc as well as returns the feature
