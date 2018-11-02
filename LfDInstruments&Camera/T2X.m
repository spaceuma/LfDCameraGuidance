function Xcart = T2X(T)


Xcart=zeros(6,1);
Xcart(1) = T(1,4);
Xcart(2) = T(2,4);
Xcart(3) = T(3,4);
Xcart(4) = atan2(T(2,3),T(1,3));
Xcart(5) = atan2(sqrt(T(1,3)^2+T(2,3)^2), T(3,3));
Xcart(6) = atan2(T(3,2),-T(3,1));



