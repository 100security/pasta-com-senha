cls
echo off
cls
REM 100SECURITY
REM Profissionais de Seguranca da Informacao
REM www.100security.com.br
REM Por: Marcos Henrique - marcos@100security.com.br
title 100SECURITY - Como proteger uma Pasta com Senha?
mode 69,23
set pasta=
set senha=
:PAINEL
cls
echo # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
echo #                                                                   #
echo #                          PASTA COM SENHA                          #
echo #                 100security.com.br/pasta-com-senha                #
echo #                                                                   #
echo # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
echo #                                                                   #
echo # [ 1 ] Criar uma Pasta                                             #
echo #                                                                   #
echo # [ 2 ] Informar uma Pasta ja existente                             #
echo #                                                                   #
echo # [ 3 ] Definir uma Senha e Proteger a pasta: [ %pasta% ]
echo #                                                                   #
echo # [ 4 ] Exibir uma pasta Protegida                                  #
echo #                                                                   #
echo # [ 5 ] Excluir uma Pasta: [ %pasta% ]
echo #                                                                   #
echo # [ 6 ] Sair                                                        #
echo #                                                                   #
echo # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
echo.
set /p menu="Selecione um numero: "
if %menu%==1 goto 1
if %menu%==2 goto 2
if %menu%==3 goto 3
if %menu%==4 goto 4
if %menu%==5 goto 5
if %menu%==6 goto FIM

:1
echo.
set /p pasta="Digite o nome da Pasta: "
echo.
if EXIST %pasta% goto ERRO-1
if NOT EXIST %pasta% goto CRIAR-1
goto FIM

:ERRO-1
echo A pasta [ %pasta% ] ja existe, tente outro nome!
goto 1

:CRIAR-1
md %pasta%
cls
goto PAINEL

:2
cls
echo.
set /p pasta="Qual o nome da pasta que deseja utilizar? "
cls
goto PAINEL

:3
cls
echo.
set /p senha="Digite a Senha para Proteger a pasta [ %pasta% ]: "
echo.
ren %pasta% "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
echo A senha [ %senha% ] foi definida e a pasta [ %pasta% ] foi protegida com sucesso!
cls
goto PAINEL

:4
cls
echo.
set /p senha1="Digite a Senha para liberar o acesso a Pasta [ %pasta% ]: "
echo.
if NOT %senha%==%senha1% goto ERRO-4
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" %pasta%
goto PAINEL

:ERRO-4
echo A senha [ %senha1% ] esta incorreta!
PAUSE
goto 4

:5
cls
echo.
set /p excluir="Voce deseja excluir a pasta [ %pasta% ] S/N? "
if %excluir%==S goto EXCLUIR
if %excluir%==s goto EXCLUIR
if %excluir%==N goto PAINEL
if %excluir%==n goto PAINEL

:EXCLUIR
echo.
rmdir /s /q %pasta% > null
del null
cls
goto PAINEL

:FIM
cls