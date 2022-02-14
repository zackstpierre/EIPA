%PA5
%Zachary St. Pierre
%101094217
%-------------------------------------------------------------------------%
clc
clear
close all
%-------------------------------------------------------------------------%

%set mode to 0 for first part of PA and to 1 for last part (different
%values on diaginal)

mode = 1;

nx = 50;
ny = 50;




G = zeros(ny*nx,ny*nx);
G = sparse(G);

V = zeros(nx*ny,1);


if mode == 0;
    
    for i = 1:nx %inside x dimensions
        for j = 1:ny %inside y dimensions
            n = j + (i-1) * ny;
            
            if i == 1
               G(n,:) = 0;
               G(n,n) = -4;
               V(n) = -4;
            elseif i == nx
                G(n,:)=0;
                G(n,n) =-4;
            elseif j == 1
                G(n,:) = 0;
                G(n,n) = -4;
                
            elseif j == ny
                G(n,:) = 0;
                G(n,n) = -4;
            else
                nxm = j + (i-2) * ny;
                nxp = j + (i) * ny;
                nym = (j-1) + (i-1) * ny;
                nyp = (j+1) + (i-1) * ny;
                
                G(n,n) = -4;
                G(n,nxm) = 1;
                G(n,nxp) = 1;
                G(n,nym) = 1;
                G(n,nyp) = 1;
            end
        end
    end

spy(G)

[E,D] = eigs(G,9,'SM');

figure(2)
spy(D)

for k = 1:size(E,2)
    for i = 1:nx
        for j = 1:ny
             n = j + (i-1) * ny;
             solutions{k}(i,j) = E(n,k);
        end
    end

end

for i = 1:size(E,2);
    figure(2+i)
    surf(solutions{i})
end
end

%-------------------------------------------------------------------------%

if mode == 1
    for i = 1:nx %inside x dimensions
            for j = 1:ny %inside y dimensions
                n = j + (i-1) * ny;

                if i == 1
                   G(n,:) = 0;
                   G(n,n) = -2;
                   V(n) = -4;
                elseif i == nx
                    G(n,:)=0;
                    G(n,n) =-2;
                elseif j == 1
                    G(n,:) = 0;
                    G(n,n) = -2;

                elseif j == ny
                    G(n,:) = 0;
                    G(n,n) = -2;

                elseif i >= 10 && i <=20
                    nxm = j + (i-2) * ny;
                    nxp = j + (i) * ny;
                    nym = (j-1) + (i-1) * ny;
                    nyp = (j+1) + (i-1) * ny;

                    G(n,n) = -2;
                    G(n,nxm) = 1;
                    G(n,nxp) = 1;
                    G(n,nym) = 1;
                    G(n,nyp) = 1;

                elseif j>=10 && j <= 20
                    nxm = j + (i-2) * ny;
                    nxp = j + (i) * ny;
                    nym = (j-1) + (i-1) * ny;
                    nyp = (j+1) + (i-1) * ny;

                    G(n,n) = -2;
                    G(n,nxm) = 1;
                    G(n,nxp) = 1;
                    G(n,nym) = 1;
                    G(n,nyp) = 1;

                else
                    nxm = j + (i-2) * ny;
                    nxp = j + (i) * ny;
                    nym = (j-1) + (i-1) * ny;
                    nyp = (j+1) + (i-1) * ny;

                    G(n,n) = -4;
                    G(n,nxm) = 1;
                    G(n,nxp) = 1;
                    G(n,nym) = 1;
                    G(n,nyp) = 1;
                end
            end
    end

    spy(G)

    [E,D] = eigs(G,9,'SM');

    figure(2)
    spy(D)
    
 for k = 1:size(E,2)
    for i = 1:nx
        for j = 1:ny
             n = j + (i-1) * ny;
             solutions{k}(i,j) = E(n,k);
        end
    end

end

for i = 1:size(E,2);
    figure(2+i)
    surf(solutions{i})
end
end
