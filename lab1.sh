#!/bin/bash

mkdir ~/lab1_final
cd ~/lab1_final
git init
git config user.name "Mark"
git config user.email "PochtaMarka@gmail.com"

mkdir claude_monet
mkdir claude_monet/kitchen
mkdir claude_monet/kitchen/morning_shift
mkdir claude_monet/kitchen/evening_shift
mkdir claude_monet/hall
mkdir claude_monet/office
mkdir staff_room
mkdir reserve_empty

touch shift_message
touch claude_monet/kitchen/morning_shift/senya_tasks
touch claude_monet/kitchen/morning_shift/fedya_tasks
touch claude_monet/kitchen/evening_shift/max_tasks
touch claude_monet/kitchen/evening_shift/denis_tasks
touch claude_monet/kitchen/leva_order
touch claude_monet/hall/table_plan
touch claude_monet/hall/complaints
touch claude_monet/office/barinov_schedule
touch staff_room/late_report

echo "Сеня принимает мясо в начале смены" > claude_monet/kitchen/morning_shift/senya_tasks
echo "До открытия нужно подготовить горячий цех" >> claude_monet/kitchen/morning_shift/senya_tasks
echo "Лёва ждёт отчёт о продуктах" >> claude_monet/kitchen/morning_shift/senya_tasks
echo "После обеда проверить остатки на складе" >> claude_monet/kitchen/morning_shift/senya_tasks

echo "Федя проверяет свежесть рыбы" > claude_monet/kitchen/morning_shift/fedya_tasks
echo "Утром подготовить холодные закуски" >> claude_monet/kitchen/morning_shift/fedya_tasks
echo "Перед подачей показать блюдо Лёве" >> claude_monet/kitchen/morning_shift/fedya_tasks
echo "В конце смены убрать рабочее место" >> claude_monet/kitchen/morning_shift/fedya_tasks

echo "Макс приходит на вечернюю смену" > claude_monet/kitchen/evening_shift/max_tasks
echo "Первое блюдо готовится для седьмого столика" >> claude_monet/kitchen/evening_shift/max_tasks
echo "Баринов поручил Максу новый соус" >> claude_monet/kitchen/evening_shift/max_tasks
echo "После закрытия помочь Лёве с отчётом" >> claude_monet/kitchen/evening_shift/max_tasks

echo "Денис выступает перед гостями вечером" > claude_monet/kitchen/evening_shift/denis_tasks
echo "До концерта он помогает на кухне" >> claude_monet/kitchen/evening_shift/denis_tasks
echo "В середине смены приготовить заказ Нагиева" >> claude_monet/kitchen/evening_shift/denis_tasks
echo "Последнее блюдо передать официантам" >> claude_monet/kitchen/evening_shift/denis_tasks

echo "Лёва распределяет задачи между поварами" > claude_monet/kitchen/leva_order
echo "Утренняя смена готовит ресторан к открытию" >> claude_monet/kitchen/leva_order
echo "Вечерняя смена отвечает за банкет" >> claude_monet/kitchen/leva_order
echo "Все отчёты передать Лёве после закрытия" >> claude_monet/kitchen/leva_order

echo "Столик один обслуживает Настя" > claude_monet/hall/table_plan
echo "Столик три оставить для постоянных гостей" >> claude_monet/hall/table_plan
echo "Столик семь принимает большой заказ" >> claude_monet/hall/table_plan
echo "Банкетный стол подготовить к вечеру" >> claude_monet/hall/table_plan

echo "Гость долго ждал блюдо от Макса" > claude_monet/hall/complaints
echo "За третьим столиком забыли принести напитки" >> claude_monet/hall/complaints
echo "Один заказ вернули на кухню" >> claude_monet/hall/complaints
echo "Вика просит разобрать жалобы после смены" >> claude_monet/hall/complaints

echo "Баринов приходит на кухню до открытия" > claude_monet/office/barinov_schedule
echo "В полдень шеф проверяет утреннюю смену" >> claude_monet/office/barinov_schedule
echo "Перед банкетом проходит общее собрание" >> claude_monet/office/barinov_schedule
echo "Лёва докладывает шефу после закрытия" >> claude_monet/office/barinov_schedule

echo "Сеня опоздал на утреннюю смену" > staff_room/late_report
echo "Макс перепутал время собрания" >> staff_room/late_report
echo "Лёва записал объяснения поваров" >> staff_room/late_report
echo "Повторные опоздания передадут Баринову" >> staff_room/late_report

echo "Команда собирается за час до открытия" > shift_message
echo "Лёва назначен старшим на текущую смену" >> shift_message
echo "Вика проверяет готовность зала" >> shift_message
echo "Баринов ждёт общий отчёт утром" >> shift_message

chmod 755 claude_monet
chmod 750 claude_monet/kitchen
chmod 750 claude_monet/kitchen/morning_shift
chmod 750 claude_monet/kitchen/evening_shift
chmod 640 claude_monet/kitchen/morning_shift/senya_tasks
chmod 640 claude_monet/kitchen/morning_shift/fedya_tasks
chmod 644 claude_monet/kitchen/evening_shift/max_tasks
chmod 644 claude_monet/kitchen/evening_shift/denis_tasks
chmod 660 claude_monet/kitchen/leva_order
chmod 755 claude_monet/hall
chmod 644 claude_monet/hall/table_plan
chmod 664 claude_monet/hall/complaints
chmod 750 claude_monet/office
chmod 640 claude_monet/office/barinov_schedule
chmod 750 staff_room
chmod 640 staff_room/late_report
chmod 700 reserve_empty
chmod 644 shift_message

git add .
git commit -m "Коммит 1"

cp staff_room/late_report claude_monet/office/discipline_report
cp -r claude_monet/kitchen/morning_shift claude_monet/kitchen/evening_shift/morning_backup
ln -s ../claude_monet/kitchen/leva_order staff_room/current_order
ln -s claude_monet/kitchen shift_kitchen
ln shift_message claude_monet/kitchen/common_message
cat claude_monet/kitchen/morning_shift/senya_tasks claude_monet/kitchen/morning_shift/fedya_tasks > claude_monet/kitchen/morning_report
cat claude_monet/office/barinov_schedule >> claude_monet/kitchen/leva_order
mv claude_monet/hall/complaints claude_monet/office/guest_complaints

git add .
git commit -m "Коммит 2"

ls -lR | grep '^-' | sort -k5,5nr | head -n 5

grep -R -i -h -E 'смен|лёва' claude_monet | grep -i -v 'отчёт' | sort | head -n 6

grep -l -i 'смен' claude_monet/kitchen/morning_shift/* claude_monet/kitchen/evening_shift/morning_backup/* | wc -l

tail -q -n 2 claude_monet/kitchen/morning_shift/*_tasks claude_monet/kitchen/evening_shift/*_tasks | grep -i -E 'лёва|смен' | sort -r

cat claude_monet/kitchen/morning_report | grep -i -v -E 'Сеня|Федя' | sort -r | head -n 4 | wc -w

ls -lR | grep '^-' | grep -E '^-.{1,} 2 ' | sort -k9

ls -lR | grep '^l' | grep -v 'shift' | sort -k9,9r

rm staff_room/late_report
rm staff_room/current_order
rm shift_kitchen
rm shift_message
rm claude_monet/kitchen/common_message
rm claude_monet/kitchen/evening_shift/denis_tasks
rmdir reserve_empty
rm -r claude_monet/kitchen/evening_shift/morning_backup

git add . 
git commit -m "Коммит 3"

git status
