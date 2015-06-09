function r = stack_box(A)
%A is square matrix
l = length(A);
hb = sqrt(l);
xb(l,l)=0;
xbt(l)=0;
counter = 0;
for i=1:hb
    for j=1:hb
        counter = counter+1;
        xtempb = A((i-1)*hb+1:i*hb,(j-1)*hb+1:j*hb);
        xtempb = xtempb';
        for t = 1:l
            xbt(t)=xtempb(t);
        end
        xb(counter,:) = xbt;
    end    
end
r = xb;
end