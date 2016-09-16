function [] =knn_comparison(distance_old,distance_young,g)
% Don't run this file -> We call it only in "knn_Classify"
% this file is called in "knn_Classify" to classify the signal by distance comparison.

if(distance_young < distance_old )
    sprintf('%s= YOUNG',g)
else
    sprintf('%s= OLD',g)
end

end