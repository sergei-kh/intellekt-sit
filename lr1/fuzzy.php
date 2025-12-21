<?php
// 1. Задаём диапазон скоростей (0..30)
$x_values = range(0, 30);

// 2. Определяем кусочно-линейные функции принадлежности

function mu_A1($x) {
    // "Слабая" - Z-образная
    if ($x <= 5) return 1;
    elseif ($x > 5 && $x < 10) return (10 - $x) / 5;
    else return 0;
}

function mu_A2($x) {
    // "Средняя" - трапециевидная
    if ($x <= 5) return 0;
    elseif ($x > 5 && $x < 10) return ($x - 5) / 5;
    elseif ($x >= 10 && $x <= 15) return 1;
    elseif ($x > 15 && $x < 20) return (20 - $x) / 5;
    else return 0;
}

function mu_A3($x) {
    // "Довольно сильная" - S-образная
    if ($x <= 15) return 0;
    elseif ($x > 15 && $x < 25) return ($x - 15) / 10;
    else return 1;
}

// 3. Вычисляем и выводим пары (μ / x)
echo "A1 (Слабая):\n";
foreach ($x_values as $x) {
    $mu = round(mu_A1($x), 2);
    echo "($mu/$x) ";
}
echo "\n\n";

echo "A2 (Средняя):\n";
foreach ($x_values as $x) {
    $mu = round(mu_A2($x), 2);
    echo "($mu/$x) ";
}
echo "\n\n";

echo "A3 (Довольно сильная):\n";
foreach ($x_values as $x) {
    $mu = round(mu_A3($x), 2);
    echo "($mu/$x) ";
}
echo "\n";
?>
