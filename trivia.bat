@echo off
chcp 65001

title Trivia col·laborativa
setlocal enabledelayedexpansion

rem Base de preguntes (cada participant n'afegirà més)
set "q1=Quin és el llenguatge de programació més utilitzat per IA?"
set "a1=Python"

set "q2=Quin any es va crear Git?"
set "a2=2005"

rem Variables inicials
set /a score=0
set /a totalQuestions=2

echo Benvinguts al joc Trivia col·laborativa!
echo.
pause

for /L %%i in (1,1,%totalQuestions%) do (
    call :askQuestion %%i
)

echo.
echo Joc acabat! Has encertat %score% de %totalQuestions% preguntes.
pause
exit

:askQuestion
set "question=q%1"
set "answer=a%1"
echo Pregunta %1: !%question%!
set /p userAnswer=Resposta: 
if /I "!userAnswer!"=="!%answer%!" (
    echo Correcte!
    set /a score+=1
) else (
    echo Incorrecte! La resposta correcta era: !%answer%!
)
echo.
exit /b
