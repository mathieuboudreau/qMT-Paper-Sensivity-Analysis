b1_n = sensitivity_b1{1}.sensitivity./norm(sensitivity_b1{1}.sensitivity)

b1t1_n = sensitivity_b1t1{1}.sensitivity./norm(sensitivity_b1t1{1}.sensitivity)

F_n = sensitivity_F{1}.sensitivity./norm(sensitivity_F{1}.sensitivity)

kf_n = sensitivity_kf{1}.sensitivity./norm(sensitivity_kf{1}.sensitivity)

t2f_n = sensitivity_t2f{1}.sensitivity./norm(sensitivity_t2f{1}.sensitivity)

t2r_n = sensitivity_t2r{1}.sensitivity./norm(sensitivity_t2r{1}.sensitivity)

A(1,1)=dot(b1_n, F_n)

A(1,2)=dot(b1_n, kf_n)

A(1,3)=dot(b1_n, t2f_n)

A(1,4)=dot(b1_n, t2r_n)


A(2,1)=dot(b1t1_n, F_n)

A(2,2)=dot(b1t1_n, kf_n)

A(2,3)=dot(b1t1_n, t2f_n)

A(2,4)=dot(b1t1_n, t2r_n)


B(1,1)=(norm(sensitivity_F{1}.sensitivity)/norm(sensitivity_b1{1}.sensitivity))

B(1,2)=(norm(sensitivity_kf{1}.sensitivity)/norm(sensitivity_b1{1}.sensitivity))

B(1,3)=(norm(sensitivity_t2f{1}.sensitivity)/norm(sensitivity_b1{1}.sensitivity))

B(1,4)=(norm(sensitivity_t2r{1}.sensitivity)/norm(sensitivity_b1{1}.sensitivity))


B(2,1)=(norm(sensitivity_F{1}.sensitivity)/norm(sensitivity_b1t1{1}.sensitivity))

B(2,2)=(norm(sensitivity_kf{1}.sensitivity)/norm(sensitivity_b1t1{1}.sensitivity))

B(2,3)=(norm(sensitivity_t2f{1}.sensitivity)/norm(sensitivity_b1t1{1}.sensitivity))

B(2,4)=(norm(sensitivity_t2r{1}.sensitivity)/norm(sensitivity_b1t1{1}.sensitivity))


A=abs(A)

B = 1./B
