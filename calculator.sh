#!/bin/bash

# Записуємо передані параметри у змінні a і b
a=$1
b=$2

# Обчислюємо результати операцій
sum=$((a + b))
difference=$((a - b))
product=$((a * b))
quotient=$((a / b))
remainder=$((a % b))

# Виводимо результати на екран
echo "Сума: $sum"
echo "Різниця: $difference"
echo "Добуток: $product"
echo "Частка від ділення: $quotient"
echo "Залишок від ділення: $remainder"

# Записуємо результати у файл result.txt
echo "Сума: $sum" >> result.txt
echo "Різниця: $difference" >> result.txt
echo "Добуток: $product" >> result.txt
echo "Частка від ділення: $quotient" >> result.txt
echo "Залишок від ділення: $remainder" >> result.tx