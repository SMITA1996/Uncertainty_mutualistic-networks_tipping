function dx = ODES_one(t,x,alpha,beta,gamma)

%---Parameters for mutualistic dynamics-----------
h = 0.5;

dx = x*(alpha - beta*x + (gamma*x)/(1+h*gamma*x));
