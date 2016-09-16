% For old signals, we calculate 4 features, mean and standard deviation.
[e1,p1,ne1,c1]=Feature_calc('f1o01');
[e2,p2,ne2,c2]=Feature_calc('f2o02');
[e3,p3,ne3,c3]=Feature_calc('f1o03');
[e4,p4,ne4,c4]=Feature_calc('f2o04');
[e5,p5,ne5,c5]=Feature_calc('f1o05');
[e6,p6,ne6,c6]=Feature_calc('f2o06');
[e7,p7,ne7,c7]=Feature_calc('f1o07');
[e8,p8,ne8,c8]=Feature_calc('f2o08');
[e9,p9,ne9,c9]=Feature_calc('f1o09');
[e10,p10,ne10,c10]=Feature_calc('f2o10');
[e11,p11,ne11,c11]=Feature_calc('f2o03');
[e12,p12,ne12,c12]=Feature_calc('f1o04');

old_energy=[e1,e2,e3,e4,e5,e6,e7,e8,e9,e10,e11,e12];
[e_mu_o,e_sigma_o] = normfit(old_energy);
old_power = [p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12];
[p_mu_o , p_sigma_o] = normfit(old_power);
old_nnl_energy = [ne1,ne2,ne3,ne4,ne5,ne6,ne7,ne8,ne9,ne10,ne11,ne12];
[nnl_mu_o , nnl_sigma_o] = normfit(old_nnl_energy);
old_curve_length = [c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12];
[cl_mu_o , cl_sigma_o] = normfit(old_curve_length);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% For young signals, we calculate 4 features, mean and standard deviation.
[e1,p1,ne1,c1]=Feature_calc('f1y01');
[e2,p2,ne2,c2]=Feature_calc('f2y02');
[e3,p3,ne3,c3]=Feature_calc('f1y03');
[e4,p4,ne4,c4]=Feature_calc('f2y04');
[e5,p5,ne5,c5]=Feature_calc('f1y05');
[e6,p6,ne6,c6]=Feature_calc('f2y06');
[e7,p7,ne7,c7]=Feature_calc('f1y07');
[e8,p8,ne8,c8]=Feature_calc('f2y08');
[e9,p9,ne9,c9]=Feature_calc('f1y09');
[e10,p10,ne10,c10]=Feature_calc('f2y10');
[e11,p11,ne11,c11]=Feature_calc('f1y04');
[e12,p12,ne12,c12]=Feature_calc('f2y01');

young_energy=[e1,e2,e3,e4,e5,e6,e7,e8,e9,e10,e11,e12];
young_power = [p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12];
young_nnl_energy = [ne1,ne2,ne3,ne4,ne5,ne6,ne7,ne8,ne9,ne10,ne11,ne12];
young_curve_length = [c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12];
[e_mu_y,e_sigma_y]=normfit(young_energy);
[p_mu_y,p_sigma_y]=normfit(young_power);
[nnl_mu_y,nnl_sigma_y]=normfit(young_nnl_energy);
[cl_mu_y,cl_sigma_y]=normfit(young_curve_length);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
