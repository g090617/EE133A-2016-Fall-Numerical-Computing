%%
 [t,n] = mooreslaw;
 b = log(n);
 temp = ones(13,1) - 2.*ones(13,1);
 A = [t temp];
 x = A\b;
 t0 = x(2,1)/x(1,1)
 alpha = exp((x(1,1)))
 
 num_trans = alpha.^(t-t0.*ones(13,1)); 
 
 semilogy(t, n, 'o');
 hold on
 semilogy(t,num_trans,'-');
 xlabel('year')
 ylabel('number of transitors')