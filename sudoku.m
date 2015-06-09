function r1 = sudoku(A)
l = length(A);
hb = sqrt(l);
ideal = 1:l;

xr = stack_rows(A);%stacking the rows separate

% Now starts the game!
% Game will continue till everything becomes non-zero
x_comp = zeros(l,l);%this is to keep track if something is changing or not
while (count_zero(xr)~=0)
    %first step:fill the one that are only one short
    while (sum(x_comp-xr)~=0)
        x_comp = xr;
        % Checking if any of the rows is just one short
        for i = 1:l
            if(count_zero(xr(i,:))==1)
                xr(i,which_zero(xr(i,:)))=sum(ideal)-sum(xr(i,:));
            end
        end
        %checking if any column is just one short
        for i = 1:l
            if(count_zero(xr(:,i))==1)
                xr(which_zero(xr(:,i)),i)=sum(ideal)-sum(xr(:,i));
            end
        end
        %checing if any box is just one short
        xb = stack_box(xr);
        for i = 1:l
            if(count_zero(xb(i,:))==1)
                xb(i,which_zero(xb(i,:)))=sum(ideal)-sum(xb(i,:));
            end
        end
        xr = stack_box(xb);
    end
    xc = xr';
    xb = stack_box(xr);
    
    %second step:deduce from row/column, row/box, column/box
    
end
r1 = xr;
end


function r2 = stack_rows(A)
l = length(A);
xr(l,l)=0;%a blank matrix for rows
for i = 1:l
    xr(i,:) = A(i,:);
end
r2 = xr;
end
