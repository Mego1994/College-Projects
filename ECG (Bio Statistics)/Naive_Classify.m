function [probability_old,probability_young] = Naive_Classify(g)
% in "naive" we entered one input signal and classify it.

% load saved values from a file instead of running "data.m" each time.
load 'C:\Users\Mego\Desktop\ECG_Project\data.mat'
[new_energy,new_power,new_nn,new_cl]=Feature_calc(g);   %calculation 4 features for the input signal.

p_new_energy_o=normcdf(new_energy,e_mu_o,e_sigma_o);
p_new_power_o=normcdf(new_power,p_mu_o,p_sigma_o);
p_new_non_linear_o=normcdf(new_nn,nnl_mu_o,nnl_sigma_o);
p_new_curve_o=normcdf(new_cl,cl_mu_o,cl_sigma_o);
probability_old = [p_new_energy_o*p_new_curve_o*p_new_non_linear_o*p_new_power_o].*0.5  %Calculation of probability_old

p_new_energy_y = normcdf(new_energy,e_mu_y,e_sigma_y);
p_new_power_y = normcdf(new_power,p_mu_y,p_sigma_y);
p_new_non_linear_y = normcdf(new_nn,nnl_mu_y,nnl_sigma_y);
p_new_curve_y = normcdf(new_cl,cl_mu_y,cl_sigma_y);
probability_young= [p_new_curve_y*p_new_energy_y*p_new_non_linear_y*p_new_power_y].*0.5     %Calculation of probability_young

if(probability_old > probability_young)
    disp('RESULT:   OLD') 
else
    disp('RESULT:   YOUNG')
    
end
