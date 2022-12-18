@echo off
color BD

title Calculadora
echo **Calculadora**

set var=0
set num1=0
set num2=0
set resultado=0
set opc=0

:pantallainicial
echo Que tipo de operacion desea hacer?
echo 1 -Operacion sencilla con dos numeros.
echo 2 -Equacion de segundo grado.
echo 3 -Numero aleatorio.
echo 4 -Integral avanzada.
set /p var=

if %var%==1 goto :menu
if %var%==2 goto :AByC
if %var%==3 goto :random
if %var%==4 goto :integrales



:menu
echo.
echo Primer numero
set /p num1=


echo.
echo Segundo numero 
set /p num2=
pause


:operaciones
echo.
echo 1-Suma
echo 2-Resta
echo 3-Multiplicacion
echo 4-Division
echo 5-Porcentaje
echo 6-Exponente
echo 7-Raiz a de b
echo 8-Logaritmo base a de b
echo 9-Salir
echo.

set /p var=


if %var%==1 goto :suma
if %var%==2 goto :resta
if %var%==3 goto :multiplicacion
if %var%==4 goto :division
if %var%==5 goto :porcentaje
if %var%==6 goto :exponente
if %var%==7 goto :raiz
if %var%==8 goto :logaritmo
if %var%==9 goto :salir

:suma
set /a resultado=%num1%+%num2%
echo La suma de %num1% y %num2% es: %resultado%

echo.
goto :orden

:resta
set /a resultado=%num1%-%num2%
echo La resta entre %num1% y %num2% es: %resultado%

echo.
goto :orden

:multiplicacion
set /a resultado=%num1%*%num2%
echo La multiplicacion entre %num1% y %num2% es: %resultado%
if %resultado%==5 echo ¿Como has hecho eso?
echo.
goto :orden

:division
set /a resultado=%num1%/%num2%
echo La division entre %num1% y %num2% es: %resultado%
set /a resultado=%num2%*%resultado%
set /a resultado=%num1%-%resultado%
echo El residuo de la division es %resultado%
echo.
goto :orden

:porcentaje
set /a resultado=%num2%*%num1%/100
echo El %num1% porciento de %num2% es: %resultado%
echo.
goto :orden

:exponente
set resultado=1
for /L %%A in (1,1,%num2%) do set /a resultado*=%num1%
echo %num1% elevado a %num2% es: %resultado%
if %num2%==0 echo Recuerda que cualquier numero elevado a 0, es 1.
echo.
goto :orden

:logaritmo
set /a x=0
:buclelog
set /a x=x+1
set resultado=1
for /L %%A in (1,1,%x%) do set /a resultado*=%num1%
if %resultado% LSS %num2% goto :buclelog
echo El logaritmo base %num1% de %num2% es %x%
echo.
goto :orden

:raiz
set /a x=0
set /a resultado=0
:bucleraiz
set /a resultado=resultado+1
set /a x=1
for /L %%A in (1,1,%num1%) do set /a x*=%resultado%
if %x% LSS %num2% goto :bucleraiz
echo El resultado aproximado de raiz %num1% de %num2% es %resultado%
echo.
goto :orden

:random
echo Numero minimo:
set /p min=
echo Numero maximo:
set /p max=
:calcrand
set /a res= %RANDOM% * (%max% - %min% + 1) / 32768 + %min%
echo El numero es %res%

echo 1-Repetir
echo 2-Insertar nuevo rango
echo 3-Hacer otra operacion
set /p var=
echo .
if %var%==1 goto :calcrand
if %var%==2 goto :random
goto :pantallainicial


:AByC
echo.
echo Introduce valor de A
set /p A=

echo.
echo Introduce valor de B
set /p B=

echo.
echo Introduce valor de C
set /p C=
pause


:equaciones
echo Espere mientras se fuerza la solucion.
set /a x=-500
:bucle
set /a x=x+1
if %x%==500 echo La equacion no tiene solucion entera.
if %x%==500 goto :orden
set /a result=%A%*%x%*%x%+%B%*%X%+%C%
if NOT %result%==0 goto :bucle
echo El valor de X es %x%
echo Si desea encontrar otra solucion pulse 2.
echo Si prefiere pasar a otro calculo, 1.
set /p var=
if %var%==2 goto :bucle
if %var%==1 goto :orden

:integrales
echo Esta calculadora ni siquiera es capaz de usar decimales por limitaciones del lenguaje.
echo Se le va a redirceccionar a la pagina Wolfram alpha.
pause
start http://www.wolframalpha.com/calculators/integral-calculator/
pause
goto :orden

:orden
echo 1-Hacer operacion sencilla
echo 2-Equacion de segundo grado
echo 3-Salir
echo.
set /p opc=

if %opc%==1 goto :menu
if %opc%==2 goto :AByC
if %opc%==3 goto :salir

:salir
exit
