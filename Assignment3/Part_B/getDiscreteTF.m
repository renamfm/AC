function [numd, dend, Ts] = getDiscreteTF(num, den)
	
	%Calculate de sampling time
	poles = roots(den);
	x = -1./real(poles);
	Ts=min(x)*1/10;
	
	%Get poles and zeros of the discrete transfer function
	[numd, dend] = c2dm(num,den,Ts,'zoh');
end
