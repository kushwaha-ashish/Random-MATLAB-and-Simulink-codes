%Function to get which one is zero only for matrix for one zero
function r3 = which_zero(x)
for count = 1:length(x)
    if (x(count)==0)
        r3 = count;
    end
end
end