This is the README file for Anna Mengjie Yu's hw1.

load_data.m: loads the digits.mat file, removes the singleton, and reshapes the matrix.

hw1FindEigendits.m: implements the PCA algorithm, outputs the mean columns matrix and the eigenvectors
sorted by the corresponding eigenvalues in descending order.
                    
Experiment_k_vectorNum.m: Conduct experiments for accuracy for different combinations of top
eigenvectors and ks, and saves the result in matrix format.
					 
Experiment_k_imageNum.m: Conduct experiments for accuracy for different combinations of training
image number and ks, and saves the result in matrix format.
					 
visualization.m: reads the result matrix and plots.

Tutorial: Since load_data is already called in each experiment, simply open Experiment_k_imageNum.m
and Experiment_k_vectorNum.m files and click on RUN button. Then open visualization.m and click on 
the RUN button, you will get the same figure as showed in the PDF writeup.