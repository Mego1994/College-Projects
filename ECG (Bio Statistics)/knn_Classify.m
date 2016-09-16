%Records]=['f1o02';'f1o06';'f1o08';'f1o10';'f2o01';'f2o05';'f2o07';'f2o09';'f1y02';'f1y06';'f1y08';'f1y10';'f2y03';'f2y05';'f2y07';'f2y09'];
% in "Knn" we enter all records not mentioned in "test_features" in one time and classify them.
load 'C:\Users\Mego\Desktop\ECG_Project\data.mat';

% Calculation of 4 features and center for each record not included in the training (not used in "test_features")
[energy1,power1,NL_energy1,curve1]=Feature_calc('f1o02') ;
[record1] = [energy1,power1,NL_energy1,curve1];
[x1,cen1]= kmeans(record1,1);

[energy2,power2,NL_energy2,curve2]=Feature_calc('f1o06') ;
[record2] = [energy2,power2,NL_energy2,curve2];
[x2,cen2]= kmeans(record2,1);

[energy3,power3,NL_energy3,curve3]=Feature_calc('f1o08') ;
[record3] = [energy3,power3,NL_energy3,curve3];
[x3,cen3]= kmeans(record3,1);

[energy4,power4,NL_energy4,curve4]=Feature_calc('f1o10') ;
[record4] = [energy4,power4,NL_energy4,curve4];
[x4,cen4]= kmeans(record4,1);

[energy5,power5,NL_energy5,curve5]=Feature_calc('f2o01') ;
[record5] = [energy5,power5,NL_energy5,curve5];
[x5,cen5]= kmeans(record5,1);

[energy6,power6,NL_energy6,curve6]=Feature_calc('f2o05') ;
[record6] = [energy6,power6,NL_energy6,curve6];
[x6,cen6]= kmeans(record6,1);

[energy7,power7,NL_energy7,curve7]=Feature_calc('f2o07') ;
[record7] = [energy7,power7,NL_energy7,curve7];
[x7,cen7]= kmeans(record7,1);

[energy8,power8,NL_energy8,curve8]=Feature_calc('f2o09') ;
[record8] = [energy8,power8,NL_energy8,curve8];
[x8,cen8]= kmeans(record8,1);

[energy9,power9,NL_energy9,curve9]=Feature_calc('f1y02') ;
[record9] = [energy9,power9,NL_energy9,curve9];
[x9,cen9]= kmeans(record9,1);

[energy10,power10,NL_energy10,curve10]=Feature_calc('f1y06') ;
[record10] = [energy10,power10,NL_energy10,curve10];
[x10,cen10]= kmeans(record10,1);

[energy11,power11,NL_energy11,curve11]=Feature_calc('f1y08') ;
[record11] = [energy11,power11,NL_energy11,curve11];
[x11,cen11]= kmeans(record11,1);

[energy12,power12,NL_energy12,curve12]=Feature_calc('f1y10') ;
[record12] = [energy12,power12,NL_energy12,curve12];
[x12,cen12]= kmeans(record12,1);

[energy13,power13,NL_energy13,curve13]=Feature_calc('f2y03') ;
[record13] = [energy13,power13,NL_energy13,curve13];
[x13,cen13]= kmeans(record13,1);

[energy14,power14,NL_energy14,curve14]=Feature_calc('f2y05') ;
[record14] = [energy14,power14,NL_energy14,curve14];
[x14,cen14]= kmeans(record14,1);

[energy15,power15,NL_energy15,curve15]=Feature_calc('f2y07') ;
[record15] = [energy15,power15,NL_energy15,curve15];
[x15,cen15]= kmeans(record15,1);

[energy16,power16,NL_energy16,curve16]=Feature_calc('f2y09') ;
[record16] = [energy16,power16,NL_energy16,curve16];
[x16,cen16]= kmeans(record16,1);

% Calculation of distances between calculated centres above and c_old and c_young and classification the signal.

distance_old_c1=pdist2(c_old,cen1);
distance_young_c1=pdist2(c_young,cen1);
knn_comparison(distance_old_c1,distance_young_c1,'f1o02')

distance_old_c2=pdist2(c_old,cen2);
distance_young_c2=pdist2(c_young,cen2);
knn_comparison(distance_old_c2,distance_young_c2,'f1o06')

distance_old_c3=pdist2(c_old,cen3);
distance_young_c3=pdist2(c_young,cen3);
knn_comparison(distance_old_c3,distance_young_c3,'f1o08')

distance_old_c4=pdist2(c_old,cen4);
distance_young_c4=pdist2(c_young,cen4);
knn_comparison(distance_old_c4,distance_young_c4,'f1o10')

distance_old_c5=pdist2(c_old,cen5);
distance_young_c5=pdist2(c_young,cen5);
knn_comparison(distance_old_c5,distance_young_c5,'f2o01')

distance_old_c6=pdist2(c_old,cen6);
distance_young_c6=pdist2(c_young,cen6);
knn_comparison(distance_old_c6,distance_young_c6,'f2o05')

distance_old_c7=pdist2(c_old,cen7);
distance_young_c7=pdist2(c_young,cen7);
knn_comparison(distance_old_c7,distance_young_c7,'f2o07')

distance_old_c8=pdist2(c_old,cen8);
distance_young_c8=pdist2(c_young,cen8);
knn_comparison(distance_old_c8,distance_young_c8,'f2o09')

distance_old_c9=pdist2(c_old,cen9);
distance_young_c9=pdist2(c_young,cen9);
knn_comparison(distance_old_c9,distance_young_c9,'f1y02')

distance_old_c10=pdist2(c_old,cen10);
distance_young_c10=pdist2(c_young,cen10);
knn_comparison(distance_old_c10,distance_young_c10,'f1y06')

distance_old_c11=pdist2(c_old,cen11);
distance_young_c11=pdist2(c_young,cen11);
knn_comparison(distance_old_c11,distance_young_c11,'f1y08')

distance_old_c12=pdist2(c_old,cen12);
distance_young_c12=pdist2(c_young,cen12);
knn_comparison(distance_old_c12,distance_young_c12,'f1y10')

distance_old_c13=pdist2(c_old,cen13);
distance_young_c13=pdist2(c_young,cen13);
knn_comparison(distance_old_c13,distance_young_c13,'f2y03')

distance_old_c14=pdist2(c_old,cen14);
distance_young_c14=pdist2(c_young,cen14);
knn_comparison(distance_old_c14,distance_young_c14,'f2y05')

distance_old_c15=pdist2(c_old,cen15);
distance_young_c15=pdist2(c_young,cen15);
knn_comparison(distance_old_c15,distance_young_c15,'f2y07')

distance_old_c16=pdist2(c_old,cen16);
distance_young_c16=pdist2(c_young,cen16);
knn_comparison(distance_old_c16,distance_young_c16,'f2y09')
