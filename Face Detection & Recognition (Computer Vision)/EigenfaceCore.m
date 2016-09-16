function [m, A, Eigenfaces] = EigenfaceCore(T)
% Use Principle Component Analysis (PCA) to determine the most 
% discriminating features between images of faces.
%
% Description: This function gets a 2D matrix, containing all training image vectors
% and returns 3 outputs which are extracted from training database.
%
% Argument:      T                      - A 2D matrix, containing all 1D image vectors.
%                                         Suppose all P images in the training database 
%                                         have the same size of MxN. So the length of 1D 
%                                         column vectors is M*N and 'T' will be a MNxP 2D matrix.
% 
% Returns:       m                      - (M*Nx1) Mean of the training database
%                Eigenfaces             - (M*Nx(P-1)) Eigen vectors of the covariance matrix of the training database
%                A                      - (M*NxP) Matrix of centered image vectors
%

%%%%%%%%%%%%%%%%%%%%%%%% Calculating the mean image 
    m = mean(T,2); % Computing the average face image m = (1/P)*sum(Tj's)    (j = 1 : P)
    Train_Number = size(T,2);

%%%%%%%%%%%%%%%%%%%%%%%% Calculating the deviation of each image from mean image
    A = [];  
    for i = 1 : Train_Number
        temp = double(T(:,i)) - m; % Computing the difference image for each image in the training set Ai = Ti - m
        A = [A temp];       % Merging all centered images
    end

    L = A'*A; % L is the surrogate of covariance matrix C=A*A'.
    [V D] = eig(L); % Diagonal elements of D are the eigenvalues.

    %%%%%%%%%%%%%%%%%%%%%%%% Sorting and eliminating eigenvalues
    % All eigenvalues of matrix L are sorted and those who are less than a
    % specified threshold, are eliminated. 
    L_eig_vec = [];
    
    for i = 1 : size(V,2) 
        if( D(i,i)>1 )
            L_eig_vec = [L_eig_vec V(:,i)];
        end
    end

    %%%%%%%%%%%%%%%%%%%%%%%% Calculating the eigenvectors of covariance matrix 'C'
    % Eigenvectors of covariance matrix C (or so-called "Eigenfaces")
    % can be recovered from L's eiegnvectors.
    Eigenfaces = A * L_eig_vec; % A: centered image vectors
end