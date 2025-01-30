clc
clear all
load file1.mat    %data obtained after transformation on higher dimensional network
%alpha1 = (-1+0.75)*rand(1,500) -0.75;%%%for simulation on uniform prior uncomment this line
load uniform_post.mat %posterior sample
%simulation for first 500 samples from the posterior distribution
alpha1=UQpostSample(1:500); 
q1=reshape(x1,[1000,500]);
q2=reshape(gamma_1,[1000,500]);
q3=reshape(beta1,[1000,500]);
x0_high=0.1;t=2000; 
options=[];
t0 = 0; % the start time
tf = 2000; % the end time
xx=[];
gamma1=q2(1:1000,1);
beta_1=q3(1:1000,1);
x_Fixbeta = []; 
for ii=1:length(alpha1)
    ii
    alpha=alpha1(ii);
for j = length(gamma1):-1:1
    gamma(j)=gamma1(j);
    beta(j)=beta_1(j)+3;%intraspecific competition fixed at 3
    [~,x_high] = ode45(@ODES_one,[t0,tf],x0_high,options,alpha,beta(j),gamma(j));
    x_Fixbeta(j) = x_high(end);
end
xx=[xx;x_Fixbeta];
end
plot(gamma1,xx(1:500,:))   
