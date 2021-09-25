%% Sketch unit circles and induced norms for norms 1,2,inf

A = [1 2; 3 4];
T = 0:(2 * pi) / 1000:2*pi;

oneNorm = [];
twoNorm = [];
infNorm = [];

inducedOneNorm = [];
inducedTwoNorm = [];
inducedInfNorm = [];

for t = T
    vec = [sin(t);cos(t)];
    oneNorm = [oneNorm, vec / norm(vec, 1)];
    twoNorm = [twoNorm, vec / norm(vec, 2)];
    infNorm = [infNorm, vec / norm(vec, inf)];
    
    inducedOneNorm = [inducedOneNorm, A * (vec / norm(vec, 1))];
    inducedTwoNorm = [inducedTwoNorm, A * (vec / norm(vec, 2))];
    inducedInfNorm = [inducedInfNorm, A * (vec / norm(vec, inf))];
end

% tiledlayout(1, 2)
% nexttile

% hold on
% 
% plot(oneNorm(1,:), oneNorm(2,:), 'r-')
% plot(twoNorm(1,:), twoNorm(2,:), 'g-')
% plot(infNorm(1,:), infNorm(2,:), 'b-')
% 
% hold off
% 
% title("Unit Spheres for p = 1, 2, \infty")
% legend("1-norm", "2-norm", "\infty-norm")
% axis([-1.25, 1.25, -1.25, 1.25])

% nexttile

hold on

plot(inducedOneNorm(1,:), inducedOneNorm(2,:), 'r-')
plot(inducedTwoNorm(1,:), inducedTwoNorm(2,:), 'g-')
plot(inducedInfNorm(1,:), inducedInfNorm(2,:), 'b-')

title("Unit Sphere for Induced p-norm of A for p = 1, 2, \infty")
axis([-3.25, 4.2, -8, 8])

% saveas(gcf, "norms_and_induced_norms.png");


%% Find the induced norm of A_{X, Y}

maxNorm = [-1 -1 -1];
maxPoint = [0 0 ; 0 0 ; 0 0]

for t = T
    vec = [sin(t);cos(t)];
    
    oneNormed = vec / norm(vec, 1);
    twoNormed = vec / norm(vec, 2);
    infNormed = vec / norm(vec, inf);
        
    inducedOneNorm = norm(A * oneNormed, 1);
    inducedTwoNorm = norm(A * twoNormed, 2);
    inducedInfNorm = norm(A * infNormed, inf);
    
    if inducedOneNorm > maxNorm(1)
        maxNorm(1) = inducedOneNorm;
        maxPoint(1,:) = A * oneNormed;
    end
    
    if inducedTwoNorm > maxNorm(2)
        maxNorm(2) = inducedTwoNorm;
        maxPoint(2,:) = A * twoNormed;
    end
    
    if inducedInfNorm > maxNorm(3)
        maxNorm(3) = inducedInfNorm;
        maxPoint(3,:) = A * infNormed;
    end
end

scatter(maxPoint(1,1), maxPoint(1,2), 50, "r*");
text(maxPoint(1,1) + 0.1, maxPoint(1,2), "max of $\Vert Ax \Vert_{1}$ (6)", "interpreter", "latex");

scatter(maxPoint(2,1), maxPoint(2,2), 50, "g*");
text(maxPoint(2,1) + 0.1, maxPoint(2,2) - 0.1, "max of $\Vert Ax \Vert_{2}$ (5.3723)", "interpreter", "latex");

scatter(maxPoint(3,1), maxPoint(3,2), 50, "b*");
text(maxPoint(3,1) + 0.1, maxPoint(3,2), "max of $\Vert Ax \Vert_{\infty}$ (7)", "interpreter", "latex");

legend("Induced 1-norm", "Induced 2-norm", "Induced $\infty$-norm", ...
       "max of $\Vert A \Vert_{1}$", "max of $\Vert A \Vert_{2}$", ...
       "max of $\Vert A \Vert_{\infty}$", "interpreter", "latex");

hold off

display(maxNorm);
display(maxPoint);

%% 5c

A = [1 4 2 5; 8 4 3 1];
max = -1;

u_1 = [1 0 0 0];
u_2 = [0 1 0 0];
u_3 = [0 0 1 0];
u_4 = [0 0 0 1];

step = 1;

for i = 0:step:1
    for j = 0:step:1
        for k = 0:step:1
            for l = 0:step:1
                x = u_1 * i + u_2 * j + u_3 * k + u_4 * l;
                y = A * x.';
                if norm(y, 2) > max
                     max = norm(y, 2);
                end
            end
        end
    end
end

disp(max);














