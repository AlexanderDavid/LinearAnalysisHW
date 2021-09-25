%% 3a
y_1 = [1 3 -5 1].';
y_2 = [3 4 -1 -2].';
y_3 = [1 0 -1 -1].';
x = [1 1 1 1].';

G = [y_1.'*y_1 y_1.'*y_2 y_1.'*y_3;
     y_2.'*y_1 y_2.'*y_2 y_2.'*y_3;
     y_3.'*y_1 y_3.'*y_2 y_3.'*y_3];
Y = [y_1.'*x ; y_2.'*x ; y_3.'*x];

X = linsolve(G, Y);
m_0 = X(1) * y_1 + X(2) * y_2 + X(3) * y_3;
disp("3a. Best Approximation of x");
disp(m_0);

%% 4a

t = sym('t');
y_1 = t;
y_2 = t^3;

x = sin(t);

G = [inner(y_1, y_1) inner(y_1, y_2);
     inner(y_2, y_1) inner(y_2, y_2)];
 
Y = [inner(y_1, x) inner(y_2, x)].';

X = linsolve(G, Y);

x_a = y_1 * X(1) + y_2 * X(2);

%% 4b

difference = funcNorm(x- x_a);
disp(vpa(simplify(difference, "Steps", 20, "IgnoreAnalyticConstraints", true)))
% 0.00347617397

title("sin(x) and nearest approximation")
hold on
fplot(x, [0 pi/2]);
fplot(x_a, [0 pi/2]);
legend("sin(x)", "\alpha_{1} t + \alpha_{2} t^{3}");
hold off

%% 4c
y_1 = t;
y_2 = t^3;
y_3 = t^5;

v_1 = y_1 / norm(y_1);

m_02 = inner(v_1, y_2) * v_1;
v_2 = y_2 - m_02;
v_2 = v_2 / norm(v_2);

m_03 = inner(v_1, y_3) * v_1 + inner(v_2, y_3) * v_2;
v_3 = y_3 - m_03;
v_3 = v_3 / norm(v_3);

%% Functions
function [out] = inner(x1, x2)
    out = int(x1 * x2, 0, pi/2);
end

function [out] = funcNorm(x)
    out = sqrt(int(abs(x)^2, [0 pi/2]));
end