// Ось X (скорость ветра)
x = 0:1:30;

// Степени принадлежности (вставь свои, если хочешь)
// Здесь показан вариант по формулам
muA1 = zeros(x);
muA2 = zeros(x);
muA3 = zeros(x);

for i = 1:length(x)
    xi = x(i);

    // A1 - Слабая (Z)
    if xi <= 5 then
        muA1(i) = 1;
    elseif xi > 5 & xi < 10 then
        muA1(i) = (10 - xi) / 5;
    else
        muA1(i) = 0;
    end

    // A2 - Средняя (трапеция)
    if xi <= 5 then
        muA2(i) = 0;
    elseif xi > 5 & xi < 10 then
        muA2(i) = (xi - 5) / 5;
    elseif xi >= 10 & xi <= 15 then
        muA2(i) = 1;
    elseif xi > 15 & xi < 20 then
        muA2(i) = (20 - xi) / 5;
    else
        muA2(i) = 0;
    end

    // A3 - Довольно сильная (S)
    if xi <= 15 then
        muA3(i) = 0;
    elseif xi > 15 & xi < 25 then
        muA3(i) = (xi - 15) / 10;
    else
        muA3(i) = 1;
    end
end


Tmin  = min(muA1, muA2);
Tprod = muA1 .* muA2;
Tmax = max(0, muA1 + muA2 - 1);
Tdelta = zeros(muA1);
for i = 1:length(muA1)
    if muA2(i) == 1 then
        Tdelta(i) = muA1(i);
    elseif muA1(i) == 1 then
        Tdelta(i) = muA2(i);
    else
        Tdelta(i) = 0;
    end
end

Smax = max(muA1, muA2);
Ssum = muA1 + muA2 - muA1 .* muA2;
Smin = min(muA1 + muA2, 1);
Sdelta = zeros(muA1);
for i = 1:length(muA1)
    if muA2(i) == 0 then
        Sdelta(i) = muA1(i);
    elseif muA1(i) == 0 then
        Sdelta(i) = muA2(i);
    else
        Sdelta(i) = 1;
    end
end

// Построение графика
clf();
plot(x, muA1, 'r-', x, muA2, 'g-', x, muA3, 'b-', x, Sdelta, 'd--');
xlabel("Скорость ветра, м/с");
ylabel("Степень принадлежности");
legend("Слабая", "Средняя", "Довольно сильная");
xgrid();
