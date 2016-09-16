function [old_distance,young_distance]=knn_calculate (f)

load 'C:\Users\Mego\Desktop\Ecg_Project\data.mat'

[old] = [old_energy,old_power,old_nnl_energy,old_curve_length];
[x1,c_old] = kmeans(old,1);
[young] = [young_energy,young_power,young_nnl_energy,young_curve_length];
[x2,c_young] = kmeans(young,1);

[in_energy,in_power,in_NL_energy,in_curve] = Feature_calc(f);
[input] = [in_energy,in_power,in_NL_energy,in_curve];
[x3,c_input] = kmeans(input,1);

old_distance=pdist2(c_old,c_input)
young_distance=pdist2(c_young,c_input)

if(old_distance > young_distance)
    disp('RESULT:   YOUNG')
else
    disp('RESULT:   OLD')

end