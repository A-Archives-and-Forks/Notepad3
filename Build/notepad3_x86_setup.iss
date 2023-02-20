﻿;* Notepad3 - Installer script x86
;*
;* (c) Rizonesoft 2008-2023

; Requirements:
; Inno Setup: https://www.jrsoftware.org/isdl.php

; Preprocessor related stuff
#if VER < EncodeVer(6,0,5)
  #error Update your Inno Setup version (6.0.5 or newer)
#endif

#define bindir "..\Bin"

#ifnexist bindir + "\Release_x86_v143\Notepad3.exe"
  #error Compile Notepad3 x86 first
#endif

#ifnexist bindir + "\Release_x86_v143\minipath.exe"
  #error Compile MiniPath x86 first
#endif

#ifnexist bindir + "\Release_x86_v143\grepWinNP3.exe"
  #error Compile grepWinNP3 x86 first
#endif

#ifnexist bindir + "\Release_x86_v143\np3encrypt.exe"
  #error Compile np3encrypt x86 first
#endif

#define app_name "Notepad3"
#define app_publisher "Rizonesoft"
#define app_version GetVersionNumbersString(bindir + "\Release_x86_v143\Notepad3.exe")
#define app_copyright "Copyright © 2008-2023 Rizonesoft"
#define quick_launch "{userappdata}\Microsoft\Internet Explorer\Quick Launch"

[Setup]
AppId={#app_name}
AppName={#app_name} (x86)
AppVersion={#app_version}
AppVerName={#app_name} {#app_version}
AppPublisher={#app_publisher}
AppPublisherURL=https://rizonesoft.com
AppSupportURL=https://rizonesoft.com
AppUpdatesURL=https://rizonesoft.com
AppContact=https://rizonesoft.com
AppCopyright={#app_copyright}
VersionInfoVersion={#app_version}
UninstallDisplayIcon={app}\Notepad3.exe
UninstallDisplayName={#app_name} (x86) {#app_version}
DefaultDirName={commonpf}\Notepad3
LicenseFile="..\License.txt"
OutputDir=.\Packages
OutputBaseFilename={#app_name}_{#app_version}_x86_Setup
WizardStyle=modern
WizardSmallImageFile=.\Resources\WizardSmallImageFile.bmp
Compression=lzma2/max
InternalCompressLevel=max
SolidCompression=yes
EnableDirDoesntExistWarning=no
AllowNoIcons=yes
ShowTasksTreeLines=yes
DisableProgramGroupPage=yes
DisableReadyPage=yes
DisableWelcomePage=yes
AllowCancelDuringInstall=yes
UsedUserAreasWarning=no
MinVersion=0,6.1sp1
ArchitecturesAllowed=x86 x64 arm64
ArchitecturesInstallIn64BitMode=
CloseApplications=true
SetupMutex='{#app_name}' + '_setup_mutex'

[Languages]
Name: "enu"; MessagesFile: "compiler:Default.isl"
Name: "afk"; MessagesFile: "compiler:Notepad3\Afrikaans.isl"
Name: "bel"; MessagesFile: "compiler:Notepad3\Belarusian.isl"
Name: "deu"; MessagesFile: "compiler:Notepad3\German.isl"
Name: "ell"; MessagesFile: "compiler:Notepad3\Greek.isl"
Name: "eng"; MessagesFile: "compiler:Notepad3\EnglishBritish.isl"
Name: "esn"; MessagesFile: "compiler:Notepad3\Spanish.isl"
Name: "esm"; MessagesFile: "compiler:Notepad3\SpanishMexican.isl"
Name: "fra"; MessagesFile: "compiler:Notepad3\French.isl"
Name: "hin"; MessagesFile: "compiler:Notepad3\Hindi.isl"
Name: "hun"; MessagesFile: "compiler:Notepad3\Hungarian.isl"
Name: "ind"; MessagesFile: "compiler:Notepad3\Indonesian.isl"
Name: "ita"; MessagesFile: "compiler:Notepad3\Italian.isl"
Name: "jpn"; MessagesFile: "compiler:Notepad3\Japanese.isl"
Name: "kor"; MessagesFile: "compiler:Notepad3\Korean.isl"
Name: "nld"; MessagesFile: "compiler:Notepad3\Dutch.isl"
Name: "plk"; MessagesFile: "compiler:Notepad3\Polish.isl"
Name: "ptb"; MessagesFile: "compiler:Notepad3\BrazilianPortuguese.isl"
Name: "ptg"; MessagesFile: "compiler:Notepad3\Portuguese.isl"
Name: "rus"; MessagesFile: "compiler:Notepad3\Russian.isl"
Name: "sky"; MessagesFile: "compiler:Notepad3\Slovak.isl"
Name: "sve"; MessagesFile: "compiler:Notepad3\Swedish.isl"
Name: "trk"; MessagesFile: "compiler:Notepad3\Turkish.isl"
Name: "vit"; MessagesFile: "compiler:Notepad3\Vietnamese.isl"
Name: "chs"; MessagesFile: "compiler:Notepad3\ChineseSimplified.isl"
Name: "cht"; MessagesFile: "compiler:Notepad3\ChineseTraditional.isl"

[Messages]
enu.BeveledLabel=English (US)
afk.BeveledLabel=Afrikaans
bel.BeveledLabel=Belarusian
deu.BeveledLabel=German
ell.BeveledLabel=Greek
eng.BeveledLabel=English (GB)
esn.BeveledLabel=Spanish
esm.BeveledLabel=Spanish (MX)
fra.BeveledLabel=French
hin.BeveledLabel=Hindi
hun.BeveledLabel=Hungarian
ind.BeveledLabel=Indonesian
ita.BeveledLabel=Italian
jpn.BeveledLabel=Japanese
kor.BeveledLabel=Korean
nld.BeveledLabel=Dutch
plk.BeveledLabel=Polish
ptb.BeveledLabel=Portuguese (BR)
ptg.BeveledLabel=Portuguese
rus.BeveledLabel=Russian
sky.BeveledLabel=Slovak
sve.BeveledLabel=Swedish
trk.BeveledLabel=Turkish
vit.BeveledLabel=Vietnamese
chs.BeveledLabel=Chinese (CN)
cht.BeveledLabel=Chinese (TW)

[CustomMessages]
enu.msg_DeleteSettings=Do you also want to delete {#app_name}'s settings and themes?%n%nIf you plan on installing {#app_name} again then you do not have to delete them.
#if defined(sse_required)
enu.msg_simd_sse=This build of {#app_name} requires a CPU with SSE extension support.%n%nYour CPU does not have those capabilities.
#elif defined(sse2_required)
enu.msg_simd_sse2=This build of {#app_name} requires a CPU with SSE2 extension support.%n%nYour CPU does not have those capabilities.
#endif
enu.tsk_AllUsers=For all users
enu.tsk_CurrentUser=For the current user only
enu.tsk_Other=Other tasks:
enu.tsk_ResetSettings=Reset {#app_name}'s settings and themes
enu.tsk_RemoveDefault=Restore Windows Notepad
enu.tsk_SetDefault=Replace Windows Notepad with {#app_name}
enu.tsk_StartMenuIcon=Create a Start Menu shortcut
enu.tsk_LaunchWelcomePage=Important Release Information!
enu.tsk_RemoveOpenWith=Remove "Open with {#app_name}" from the context menu
enu.tsk_SetOpenWith=Add "Open with {#app_name}" to the context menu

afk.msg_DeleteSettings=Wil jy ook {#app_name} se instellings en temas uitvee?%n%nAs jy beplan om {#app_name} weer te installeer, hoef jy dit nie uit te vee nie.
#if defined(sse_required)
afk.msg_simd_sse=Hierdie bou van {#app_name} vereis 'n SVE met SSE-uitbreidingsteun.%n%nJou SVE het nie daardie vermoëns nie.
#elif defined(sse2_required)
afk.msg_simd_sse2=Hierdie bou van {#app_name} vereis 'n SVE met SSE2-uitbreidingsteun.%n%nJou SVE het nie daardie vermoëns nie.
#endif
afk.tsk_AllUsers=Vir alle gebruikers
afk.tsk_CurrentUser=Slegs vir die huidige gebruiker
afk.tsk_Other=
afk.tsk_ResetSettings=Stel {#app_name} se instellings en temas terug
afk.tsk_RemoveDefault=Herstel Windows Notepad
afk.tsk_SetDefault=Vervang Windows Notepad met {#app_name}
afk.tsk_StartMenuIcon=Skep 'n Start Menu-kortpad
afk.tsk_LaunchWelcomePage=Belangrike vrystelling-inligting!
afk.tsk_RemoveOpenWith=Verwyder "Verwyder Maak oop met {#app_name}" uit die kontekskieslys
afk.tsk_SetOpenWith=Sit "Maak oop met {#app_name}" in die kontekskieslys

bel.msg_DeleteSettings=Do you also want to delete {#app_name}'s settings and themes?%n%nIf you plan on installing {#app_name} again then you do not have to delete them.
#if defined(sse_required)
bel.msg_simd_sse=This build of {#app_name} requires a CPU with SSE extension support.%n%nYour CPU does not have those capabilities.
#elif defined(sse2_required)
bel.msg_simd_sse2=This build of {#app_name} requires a CPU with SSE2 extension support.%n%nYour CPU does not have those capabilities.
#endif
bel.tsk_AllUsers=For all users
bel.tsk_CurrentUser=For the current user only
bel.tsk_Other=Other tasks:
bel.tsk_ResetSettings=Reset {#app_name}'s settings and themes
bel.tsk_RemoveDefault=Restore Windows Notepad
bel.tsk_SetDefault=Replace Windows Notepad with {#app_name}
bel.tsk_StartMenuIcon=Create a Start Menu shortcut
bel.tsk_LaunchWelcomePage=Important Release Information!
bel.tsk_RemoveOpenWith=Remove "Open with {#app_name}" from the context menu
bel.tsk_SetOpenWith=Add "Open with {#app_name}" to the context menu

deu.msg_DeleteSettings=Wollen sie die Einstellungen und Themen von {#app_name} löschen?%n%nWenn sie planen {#app_name} erneut zu installieren, dann müssen diese Einstellungen nicht gelöscht werden.
#if defined(sse_required)
deu.msg_simd_sse=Diese Version von {#app_name} benötigt eine CPU mit welche die SSE Erweiterung unterstützt.%n%nIhre CPU hat diese Fähigkeiten nicht.
#elif defined(sse2_required)
deu.msg_simd_sse2=Diese Version von {#app_name} benötigt eine CPU mit welche die SSE2 Erweiterung unterstützt.%n%nIhre CPU hat diese Fähigkeiten nicht.
#endif
deu.tsk_AllUsers=Für alle Benutzer
deu.tsk_CurrentUser=Für den aktuellen Benutzer alleine
deu.tsk_Other=Andere Aufgaben:
deu.tsk_ResetSettings={#app_name}s Einstellungen und Themen zurück setzen.
deu.tsk_RemoveDefault=Windows Notepad wiederherstellen
deu.tsk_SetDefault=Ersetze Windows Notepad mit {#app_name}
deu.tsk_StartMenuIcon=Erstelle einen Start-Menü Eintrag
deu.tsk_LaunchWelcomePage=Wichtige Release Information!
deu.tsk_RemoveOpenWith=Entferne "Öffnen mit {#app_name}" aus dem Kontextmenü
deu.tsk_SetOpenWith=Füge "Öffnen mit {#app_name}" zum Kontextmenü hinzu.

ell.msg_DeleteSettings=Do you also want to delete {#app_name}'s settings and themes?%n%nIf you plan on installing {#app_name} again then you do not have to delete them.
#if defined(sse_required)
ell.msg_simd_sse=This build of {#app_name} requires a CPU with SSE extension support.%n%nYour CPU does not have those capabilities.
#elif defined(sse2_required)
ell.msg_simd_sse2=This build of {#app_name} requires a CPU with SSE2 extension support.%n%nYour CPU does not have those capabilities.
#endif
ell.tsk_AllUsers=For all users
ell.tsk_CurrentUser=For the current user only
ell.tsk_Other=Other tasks:
ell.tsk_ResetSettings=Reset {#app_name}'s settings and themes
ell.tsk_RemoveDefault=Restore Windows Notepad
ell.tsk_SetDefault=Replace Windows Notepad with {#app_name}
ell.tsk_StartMenuIcon=Create a Start Menu shortcut
ell.tsk_LaunchWelcomePage=Important Release Information!
ell.tsk_RemoveOpenWith=Remove "Open with {#app_name}" from the context menu
ell.tsk_SetOpenWith=Add "Open with {#app_name}" to the context menu

eng.msg_DeleteSettings=Do you also want to delete {#app_name}'s settings and themes?%n%nIf you plan on installing {#app_name} again then you do not have to delete them.
#if defined(sse_required)
eng.msg_simd_sse=This build of {#app_name} requires a CPU with SSE extension support.%n%nYour CPU does not have those capabilities.
#elif defined(sse2_required)
eng.msg_simd_sse2=This build of {#app_name} requires a CPU with SSE2 extension support.%n%nYour CPU does not have those capabilities.
#endif
eng.tsk_AllUsers=For all users
eng.tsk_CurrentUser=For the current user only
eng.tsk_Other=Other tasks:
eng.tsk_ResetSettings=Reset {#app_name}'s settings and themes
eng.tsk_RemoveDefault=Restore Windows Notepad
eng.tsk_SetDefault=Replace Windows Notepad with {#app_name}
eng.tsk_StartMenuIcon=Create a Start Menu shortcut
eng.tsk_LaunchWelcomePage=Important Release Information!
eng.tsk_RemoveOpenWith=Remove "Open with {#app_name}" from the context menu
eng.tsk_SetOpenWith=Add "Open with {#app_name}" to the context menu

esn.msg_DeleteSettings=¿También quieres eliminar la configuración y los temas de {#app_name}?%n%nSi planeas instalar {#app_name} nuevamente, no tienes que eliminarlos.
#if defined(sse_required)
esn.msg_simd_sse=Esta compilación de {#app_name} requiere una CPU compatible con la extensión SSE.%n%nTu CPU no tiene esas capacidades.
#elif defined(sse2_required)
esn.msg_simd_sse2=Esta compilación de {#app_name} requiere una CPU compatible con la extensión SSE2.%n%nTu CPU no tiene esas capacidades.
#endif
esn.tsk_AllUsers=Para todos los usuarios
esn.tsk_CurrentUser=Sólo para el usuario actual
esn.tsk_Other=Otras tareas:
esn.tsk_ResetSettings=Restablecer la configuración y los temas de {#app_name}
esn.tsk_RemoveDefault=Restaurar el Notepad de Windows
esn.tsk_SetDefault=Reemplace el Notepad de Windows con {#app_name}
esn.tsk_StartMenuIcon=Crear un acceso directo al menú de inicio
esn.tsk_LaunchWelcomePage=¡Información importante de lanzamiento!
esn.tsk_RemoveOpenWith=Eliminar "Abrir con {#app_name}" del menú contextual
esn.tsk_SetOpenWith=Añade "Abrir con {#app_name}" al menú contextual

esm.msg_DeleteSettings=¿También quieres eliminar la configuración y los temas de {#app_name}?%n%nSi planeas instalar {#app_name} nuevamente, no tienes que eliminarlos.
#if defined(sse_required)
esm.msg_simd_sse=Esta compilación de {#app_name} requiere una CPU compatible con la extensión SSE.%n%nTu CPU no tiene esas capacidades.
#elif defined(sse2_required)
esm.msg_simd_sse2=Esta compilación de {#app_name} requiere una CPU compatible con la extensión SSE2.%n%nTu CPU no tiene esas capacidades.
#endif
esm.tsk_AllUsers=Para todos los usuarios
esm.tsk_CurrentUser=Sólo para el usuario actual
esm.tsk_Other=Otras tareas:
esm.tsk_ResetSettings=Restablecer la configuración y los temas de {#app_name}
esm.tsk_RemoveDefault=Restaurar el Notepad de Windows
esm.tsk_SetDefault=Reemplace el Notepad de Windows con {#app_name}
esm.tsk_StartMenuIcon=Crear un acceso directo al menú de inicio
esm.tsk_LaunchWelcomePage=¡Información importante de lanzamiento!
esm.tsk_RemoveOpenWith=Eliminar "Abrir con {#app_name}" del menú contextual
esm.tsk_SetOpenWith=Añade "Abrir con {#app_name}" al menú contextual

fra.msg_DeleteSettings=Voulez-vous également supprimer tous les réglages et thèmes de {#app_name} ?%n%nSi vous comptez réinstaller {#app_name}, vous pouvez les garder.
#if defined(sse_required)
fra.msg_simd_sse=Cette édition de {#app_name} nécessite un CPU supportant l'extension SSE.%n%nVotre CPU ne dispose pas de ces capacités.
#elif defined(sse2_required)
fra.msg_simd_sse2=Cette édition de {#app_name} nécessite un CPU supportant l'extension SSE2.%n%nVotre CPU ne dispose pas de ces capacités.
#endif
fra.tsk_AllUsers=Pour tous les utilisateurs
fra.tsk_CurrentUser=Uniquement pour l'utilisateur actuel
fra.tsk_Other=Autres tâches :
fra.tsk_ResetSettings=Rétablir les réglages et thèmes de {#app_name}
fra.tsk_RemoveDefault=Restaurer le Notepad de Windows
fra.tsk_SetDefault=Remplacer le Notepad de Windows par {#app_name}
fra.tsk_StartMenuIcon=Créer un raccourci dans le menu de démarrage
fra.tsk_LaunchWelcomePage=Information importante de publication !
fra.tsk_RemoveOpenWith=Retirer "Ouvrir avec {#app_name}" du menu contextuel
fra.tsk_SetOpenWith=Ajouter "Ouvrir avec {#app_name}" au menu contextuel

hin.msg_DeleteSettings=Do you also want to delete {#app_name}'s settings and themes?%n%nIf you plan on installing {#app_name} again then you do not have to delete them.
#if defined(sse_required)
hin.msg_simd_sse=This build of {#app_name} requires a CPU with SSE extension support.%n%nYour CPU does not have those capabilities.
#elif defined(sse2_required)
hin.msg_simd_sse2=This build of {#app_name} requires a CPU with SSE2 extension support.%n%nYour CPU does not have those capabilities.
#endif
hin.tsk_AllUsers=For all users
hin.tsk_CurrentUser=For the current user only
hin.tsk_Other=Other tasks:
hin.tsk_ResetSettings=Reset {#app_name}'s settings and themes
hin.tsk_RemoveDefault=Restore Windows Notepad
hin.tsk_SetDefault=Replace Windows Notepad with {#app_name}
hin.tsk_StartMenuIcon=Create a Start Menu shortcut
hin.tsk_LaunchWelcomePage=Important Release Information!
hin.tsk_RemoveOpenWith=Remove "Open with {#app_name}" from the context menu
hin.tsk_SetOpenWith=Add "Open with {#app_name}" to the context menu

hun.msg_DeleteSettings=Do you also want to delete {#app_name}'s settings and themes?%n%nIf you plan on installing {#app_name} again then you do not have to delete them.
#if defined(sse_required)
hun.msg_simd_sse=This build of {#app_name} requires a CPU with SSE extension support.%n%nYour CPU does not have those capabilities.
#elif defined(sse2_required)
hun.msg_simd_sse2=This build of {#app_name} requires a CPU with SSE2 extension support.%n%nYour CPU does not have those capabilities.
#endif
hun.tsk_AllUsers=For all users
hun.tsk_CurrentUser=For the current user only
hun.tsk_Other=Other tasks:
hun.tsk_ResetSettings=Reset {#app_name}'s settings and themes
hun.tsk_RemoveDefault=Restore Windows Notepad
hun.tsk_SetDefault=Replace Windows Notepad with {#app_name}
hun.tsk_StartMenuIcon=Create a Start Menu shortcut
hun.tsk_LaunchWelcomePage=Important Release Information!
hun.tsk_RemoveOpenWith=Remove "Open with {#app_name}" from the context menu
hun.tsk_SetOpenWith=Add "Open with {#app_name}" to the context menu

ind.msg_DeleteSettings=Do you also want to delete {#app_name}'s settings and themes?%n%nIf you plan on installing {#app_name} again then you do not have to delete them.
#if defined(sse_required)
ind.msg_simd_sse=This build of {#app_name} requires a CPU with SSE extension support.%n%nYour CPU does not have those capabilities.
#elif defined(sse2_required)
ind.msg_simd_sse2=This build of {#app_name} requires a CPU with SSE2 extension support.%n%nYour CPU does not have those capabilities.
#endif
ind.tsk_AllUsers=For all users
ind.tsk_CurrentUser=For the current user only
ind.tsk_Other=Other tasks:
ind.tsk_ResetSettings=Reset {#app_name}'s settings and themes
ind.tsk_RemoveDefault=Restore Windows Notepad
ind.tsk_SetDefault=Replace Windows Notepad with {#app_name}
ind.tsk_StartMenuIcon=Create a Start Menu shortcut
ind.tsk_LaunchWelcomePage=Important Release Information!
ind.tsk_RemoveOpenWith=Remove "Open with {#app_name}" from the context menu
ind.tsk_SetOpenWith=Add "Open with {#app_name}" to the context menu

ita.msg_DeleteSettings=Volete eliminare anche le impostazioni e i temi di {#app_name}? %n%nSe intendete installare nuovamente {#app_name}, non è necessario eliminarli.
#if defined(sse_required)
ita.msg_simd_sse=Questa versione di {#app_name} richiede una CPU con supporto per le estensioni SSE.%n%nLa vostra CPU non ha queste capacità.
#elif defined(sse2_required)
ita.msg_simd_sse2=Questa versione di {#app_name} richiede una CPU con supporto per le estensioni SSE2.%n%nLa vostra CPU non ha queste capacità.
#endif
ita.tsk_AllUsers=Per tutti gli utenti
ita.tsk_CurrentUser=Solo per l'utente corrente
ita.tsk_Other=Altre attività:
ita.tsk_ResetSettings=Ripristino delle impostazioni e dei temi di {#app_name}
ita.tsk_RemoveDefault=Ripristina il Blocco note di Windows
ita.tsk_SetDefault=Sostituisci il Blocco note di Windows con {#app_name}
ita.tsk_StartMenuIcon=Creare un collegamento al Menu Start
ita.tsk_LaunchWelcomePage=Informazioni importanti sul rilascio!
ita.tsk_RemoveOpenWith=Rimuovere l'opzione "Apri con {#app_name}" dal menu contestuale.
ita.tsk_SetOpenWith=Aggiungete "Apri con {#app_name}" al menu contestuale

jpn.msg_DeleteSettings={#app_name} の設定とテーマも削除しますか？%n%n{#app_name} を再度インストールする予定なら削除する必要はありません。
#if defined(sse_required)
jpn.msg_simd_sse={#app_name} のこのビルドには、SSE 拡張命令に対応した CPU が必要です。%n%nこの CPU は対応していません。
#elif defined(sse2_required)
jpn.msg_simd_sse2={#app_name} のこのビルドには、SSE2 拡張命令に対応した CPU が必要です。%n%nこの CPU は対応していません。
#endif
jpn.tsk_AllUsers=すべてのユーザー
jpn.tsk_CurrentUser=現在のユーザーのみ
jpn.tsk_Other=ほかの設定:
jpn.tsk_ResetSettings={#app_name} の設定とテーマを初期化
jpn.tsk_RemoveDefault=Windows のメモ帳を復元する
jpn.tsk_SetDefault=Windows のメモ帳を {#app_name} に置換する
jpn.tsk_StartMenuIcon=スタートメニューにショートカットを作成
jpn.tsk_LaunchWelcomePage=リリース時の重要な情報！
jpn.tsk_RemoveOpenWith=右クリックメニューから「{#app_name} で開く」を削除
jpn.tsk_SetOpenWith=右クリックメニューに「{#app_name} で開く」を追加

kor.msg_DeleteSettings={#app_name}의 설정 및 테마도 삭제하시겠습니까?%n%n{#app_name}을 다시 설치할 계획이라면 삭제할 필요가 없습니다.
#if defined(sse_required)
kor.msg_simd_sse=이 {#app_name} 빌드에는 SSE 확장을 지원하는 CPU가 필요합니다.%n%nCPU에 이러한 기능이 없습니다.
#elif defined(sse2_required)
kor.msg_simd_sse2=이 {#app_name} 빌드에는 SSE2 확장을 지원하는 CPU가 필요합니다.%n%nCPU에 이러한 기능이 없습니다.
#endif
kor.tsk_AllUsers=모든 사용자용
kor.tsk_CurrentUser=현재 사용자 전용
kor.tsk_Other=기타 작업:
kor.tsk_ResetSettings={#app_name}의 설정 및 테마 재설정
kor.tsk_RemoveDefault=Windows 메모장 복원
kor.tsk_SetDefault=Windows 메모장을 {#app_name}으로 바꾸기
kor.tsk_StartMenuIcon=시작 메뉴에 바로가기 만들기
kor.tsk_LaunchWelcomePage=중요한 릴리스 정보!
kor.tsk_RemoveOpenWith=상황에 맞는 메뉴에서 "{#app_name}으로 열기" 제거
kor.tsk_SetOpenWith=상황에 맞는 메뉴 메뉴에 "{#app_name}으로 열기" 추가

nld.msg_DeleteSettings=Wilt u ook de instellingen en thema's van {#app_name} verwijderen?%n%nAls u van plan bent {#app_name} opnieuw te installeren, hoeft u deze niet te verwijderen.
#if defined(sse_required)
nld.msg_simd_sse=Deze versie van {#app_name} vereist een CPU met ondersteuning voor SSE-extensies.%n%nUw CPU heeft die mogelijkheden niet.
#elif defined(sse2_required)
nld.msg_simd_sse2=Deze versie van {#app_name} vereist een CPU met ondersteuning voor SSE2-extensies.%n%nUw CPU heeft die mogelijkheden niet.
#endif
nld.tsk_AllUsers=Voor alle gebruikers
nld.tsk_CurrentUser=Alleen voor de huidige gebruiker
nld.tsk_Other=Overige taken:
nld.tsk_ResetSettings=Instellingen en thema's van {#app_name} opnieuw instellen
nld.tsk_RemoveDefault=Windows Notepad opnieuw instellen
nld.tsk_SetDefault=Windows Notepad vervangen door {#app_name}
nld.tsk_StartMenuIcon=Maak een snelkoppeling naar het startmenu
nld.tsk_LaunchWelcomePage=Belangrijke informatie bij deze uitgave!
nld.tsk_RemoveOpenWith="Openen met {#app_name}" verwijderen van het contextmenu
nld.tsk_SetOpenWith="Openen met {#app_name}" toevoegen van het contextmenu

plk.msg_DeleteSettings=Do you also want to delete {#app_name}'s settings and themes?%n%nIf you plan on installing {#app_name} again then you do not have to delete them.
#if defined(sse_required)
plk.msg_simd_sse=This build of {#app_name} requires a CPU with SSE extension support.%n%nYour CPU does not have those capabilities.
#elif defined(sse2_required)
plk.msg_simd_sse2=This build of {#app_name} requires a CPU with SSE2 extension support.%n%nYour CPU does not have those capabilities.
#endif
plk.tsk_AllUsers=For all users
plk.tsk_CurrentUser=For the current user only
plk.tsk_Other=Other tasks:
plk.tsk_ResetSettings=Reset {#app_name}'s settings and themes
plk.tsk_RemoveDefault=Restore Windows Notepad
plk.tsk_SetDefault=Replace Windows Notepad with {#app_name}
plk.tsk_StartMenuIcon=Create a Start Menu shortcut
plk.tsk_LaunchWelcomePage=Important Release Information!
plk.tsk_RemoveOpenWith=Remove "Open with {#app_name}" from the context menu
plk.tsk_SetOpenWith=Add "Open with {#app_name}" to the context menu

ptb.msg_DeleteSettings=Você também deseja excluir as configurações e temas do {#app_name}?%n%nSe você planeja instalar o {#app_name} novamente, então você não precisa excluí-los.
#if defined(sse_required)
ptb.msg_simd_sse=Esta versão do {#app_name} requer uma CPU com suporte à extensão SSE.%n%nSua CPU não possui este recurso.
#elif defined(sse2_required)
ptb.msg_simd_sse2=Esta versão do {#app_name} requer uma CPU com suporte à extensão SSE2.%n%nSua CPU não possui este recurso.
#endif
ptb.tsk_AllUsers=Para todos os usuários
ptb.tsk_CurrentUser=Somente para o usuário atual
ptb.tsk_Other=Tarefas adicionais:
ptb.tsk_ResetSettings=Restaurar configurações e temas do {#app_name}
ptb.tsk_RemoveDefault=Restaurar Bloco de notas do Windows
ptb.tsk_SetDefault=Substituir Bloco de notas do Windows pelo {#app_name}
ptb.tsk_StartMenuIcon=Criar atalho no Menu Iniciar
ptb.tsk_LaunchWelcomePage=Informações importantes sobre esta versão!
ptb.tsk_RemoveOpenWith=Remover "Abrir com o {#app_name}" do menu de contexto
ptb.tsk_SetOpenWith=Adicionar "Abrir com {#app_name} ao menu de contexto 

ptg.msg_DeleteSettings=Do you also want to delete {#app_name}'s settings and themes?%n%nIf you plan on installing {#app_name} again then you do not have to delete them.
#if defined(sse_required)
ptg.msg_simd_sse=This build of {#app_name} requires a CPU with SSE extension support.%n%nYour CPU does not have those capabilities.
#elif defined(sse2_required)
ptg.msg_simd_sse2=This build of {#app_name} requires a CPU with SSE2 extension support.%n%nYour CPU does not have those capabilities.
#endif
ptg.tsk_AllUsers=For all users
ptg.tsk_CurrentUser=For the current user only
ptg.tsk_Other=Other tasks:
ptg.tsk_ResetSettings=Reset {#app_name}'s settings and themes
ptg.tsk_RemoveDefault=Restore Windows Notepad
ptg.tsk_SetDefault=Replace Windows Notepad with {#app_name}
ptg.tsk_StartMenuIcon=Create a Start Menu shortcut
ptg.tsk_LaunchWelcomePage=Important Release Information!
ptg.tsk_RemoveOpenWith=Remove "Open with {#app_name}" from the context menu
ptg.tsk_SetOpenWith=Add "Open with {#app_name}" to the context menu

rus.msg_DeleteSettings=Do you also want to delete {#app_name}'s settings and themes?%n%nIf you plan on installing {#app_name} again then you do not have to delete them.
#if defined(sse_required)
rus.msg_simd_sse=This build of {#app_name} requires a CPU with SSE extension support.%n%nYour CPU does not have those capabilities.
#elif defined(sse2_required)
rus.msg_simd_sse2=This build of {#app_name} requires a CPU with SSE2 extension support.%n%nYour CPU does not have those capabilities.
#endif
rus.tsk_AllUsers=For all users
rus.tsk_CurrentUser=For the current user only
rus.tsk_Other=Other tasks:
rus.tsk_ResetSettings=Reset {#app_name}'s settings and themes
rus.tsk_RemoveDefault=Restore Windows Notepad
rus.tsk_SetDefault=Replace Windows Notepad with {#app_name}
rus.tsk_StartMenuIcon=Create a Start Menu shortcut
rus.tsk_LaunchWelcomePage=Important Release Information!
rus.tsk_RemoveOpenWith=Remove "Open with {#app_name}" from the context menu
rus.tsk_SetOpenWith=Add "Open with {#app_name}" to the context menu

sky.msg_DeleteSettings=Chcete odstrániť aj nastavenia a témy {#app_name}?%n%nAk plánujete opätovnú inštaláciu {#app_name}, nemusíte ich odstraňovať.
#if defined(sse_required)
sky.msg_simd_sse=Táto zostava {#app_name} vyžaduje procesor s podporou rozšírenia SSE.%n%nVáš procesor tieto možnosti nemá.
#elif defined(sse2_required)
sky.msg_simd_sse2=Táto zostava {#app_name} vyžaduje procesor s podporou rozšírenia SSE2.%n%nVáš procesor tieto možnosti nemá.
#endif
sky.tsk_AllUsers=Pre všetkých užívateľov
sky.tsk_CurrentUser=Len pre aktuálneho užívateľa
sky.tsk_Other=Ďalšie možnosti:
sky.tsk_ResetSettings=Obnoviť nastavenia a témy {#app_name} na predvolené hodnoty
sky.tsk_RemoveDefault=Obnoviť Poznámkový blok Windows
sky.tsk_SetDefault=Nahradiť Poznámkový blok Windows s {#app_name}
sky.tsk_StartMenuIcon=Vytvoriť odkaz v ponuke Štart
sky.tsk_LaunchWelcomePage=Dôležité informácie o vydaní!
sky.tsk_RemoveOpenWith=Odstrániť z kontextového menu položku "Otvoriť v {#app_name}" 
sky.tsk_SetOpenWith=Pridať do kontextového menu položku "Otvoriť v {#app_name}"

sve.msg_DeleteSettings=Vill du även ta bort {#app_name} inställningar och teman?%n%nOm du tänker installera {#app_name} igen behöver du inte ta bort inställningarna.
#if defined(sse_required)
sve.msg_simd_sse=Den här versionen av {#app_name} kräver processor med SSE stöd.%n%n din processor har inte denna funktionalitet.
#elif defined(sse2_required)
sve.msg_simd_sse2=Den här versionen av {#app_name} kräver processor med SSE2 stöd.%n%n din processor har inte denna funktionalitet.
#endif
sve.tsk_AllUsers=För alla användare
sve.tsk_CurrentUser=Endast för aktuell användare
sve.tsk_Other=Andra uppgifter:
sve.tsk_ResetSettings=Återställ inställningarna och tema för {#app_name}
sve.tsk_RemoveDefault=Återställ Windows Anteckningar
sve.tsk_SetDefault=Ersätt Windows Anteckningar med {#app_name}
sve.tsk_StartMenuIcon=Skapa en genväg till Startmeny
sve.tsk_LaunchWelcomePage=Viktig information för denna version!
sve.tsk_RemoveOpenWith=Ta bort "Öppna med {#app_name}" från snabbmenyn
sve.tsk_SetOpenWith=Lägg till "Öppna med {#app_name}" från snabbmenyn

trk.msg_DeleteSettings=Do you also want to delete {#app_name}'s settings and themes?%n%nIf you plan on installing {#app_name} again then you do not have to delete them.
#if defined(sse_required)
trk.msg_simd_sse=This build of {#app_name} requires a CPU with SSE extension support.%n%nYour CPU does not have those capabilities.
#elif defined(sse2_required)
trk.msg_simd_sse2=This build of {#app_name} requires a CPU with SSE2 extension support.%n%nYour CPU does not have those capabilities.
#endif
trk.tsk_AllUsers=For all users
trk.tsk_CurrentUser=For the current user only
trk.tsk_Other=Other tasks:
trk.tsk_ResetSettings=Reset {#app_name}'s settings and themes
trk.tsk_RemoveDefault=Restore Windows Notepad
trk.tsk_SetDefault=Replace Windows Notepad with {#app_name}
trk.tsk_StartMenuIcon=Create a Start Menu shortcut
trk.tsk_LaunchWelcomePage=Important Release Information!
trk.tsk_RemoveOpenWith=Remove "Open with {#app_name}" from the context menu
trk.tsk_SetOpenWith=Add "Open with {#app_name}" to the context menu

vit.msg_DeleteSettings=Do you also want to delete {#app_name}'s settings and themes?%n%nIf you plan on installing {#app_name} again then you do not have to delete them.
#if defined(sse_required)
vit.msg_simd_sse=This build of {#app_name} requires a CPU with SSE extension support.%n%nYour CPU does not have those capabilities.
#elif defined(sse2_required)
vit.msg_simd_sse2=This build of {#app_name} requires a CPU with SSE2 extension support.%n%nYour CPU does not have those capabilities.
#endif
vit.tsk_AllUsers=For all users
vit.tsk_CurrentUser=For the current user only
vit.tsk_Other=Other tasks:
vit.tsk_ResetSettings=Reset {#app_name}'s settings and themes
vit.tsk_RemoveDefault=Restore Windows Notepad
vit.tsk_SetDefault=Replace Windows Notepad with {#app_name}
vit.tsk_StartMenuIcon=Create a Start Menu shortcut
vit.tsk_LaunchWelcomePage=Important Release Information!
vit.tsk_RemoveOpenWith=Remove "Open with {#app_name}" from the context menu
vit.tsk_SetOpenWith=Add "Open with {#app_name}" to the context menu

chs.msg_DeleteSettings=Do you also want to delete {#app_name}'s settings and themes?%n%nIf you plan on installing {#app_name} again then you do not have to delete them.
#if defined(sse_required)
chs.msg_simd_sse=This build of {#app_name} requires a CPU with SSE extension support.%n%nYour CPU does not have those capabilities.
#elif defined(sse2_required)
chs.msg_simd_sse2=This build of {#app_name} requires a CPU with SSE2 extension support.%n%nYour CPU does not have those capabilities.
#endif
chs.tsk_AllUsers=For all users
chs.tsk_CurrentUser=For the current user only
chs.tsk_Other=Other tasks:
chs.tsk_ResetSettings=Reset {#app_name}'s settings and themes
chs.tsk_RemoveDefault=Restore Windows Notepad
chs.tsk_SetDefault=Replace Windows Notepad with {#app_name}
chs.tsk_StartMenuIcon=Create a Start Menu shortcut
chs.tsk_LaunchWelcomePage=Important Release Information!
chs.tsk_RemoveOpenWith=Remove "Open with {#app_name}" from the context menu
chs.tsk_SetOpenWith=Add "Open with {#app_name}" to the context menu

cht.msg_DeleteSettings=Do you also want to delete {#app_name}'s settings and themes?%n%nIf you plan on installing {#app_name} again then you do not have to delete them.
#if defined(sse_required)
cht.msg_simd_sse=This build of {#app_name} requires a CPU with SSE extension support.%n%nYour CPU does not have those capabilities.
#elif defined(sse2_required)
cht.msg_simd_sse2=This build of {#app_name} requires a CPU with SSE2 extension support.%n%nYour CPU does not have those capabilities.
#endif
cht.tsk_AllUsers=For all users
cht.tsk_CurrentUser=For the current user only
cht.tsk_Other=Other tasks:
cht.tsk_ResetSettings=Reset {#app_name}'s settings and themes
cht.tsk_RemoveDefault=Restore Windows Notepad
cht.tsk_SetDefault=Replace Windows Notepad with {#app_name}
cht.tsk_StartMenuIcon=Create a Start Menu shortcut
cht.tsk_LaunchWelcomePage=Important Release Information!
cht.tsk_RemoveOpenWith=Remove "Open with {#app_name}" from the context menu
cht.tsk_SetOpenWith=Add "Open with {#app_name}" to the context menu

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "desktopicon\user"; Description: "{cm:tsk_CurrentUser}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked exclusive
Name: "desktopicon\common"; Description: "{cm:tsk_AllUsers}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked exclusive
Name: "startup_icon"; Description: "{cm:tsk_StartMenuIcon}"; GroupDescription: "{cm:AdditionalIcons}"
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 6.01
Name: "reset_settings"; Description: "{cm:tsk_ResetSettings}"; GroupDescription: "{cm:tsk_Other}"; Flags: checkedonce unchecked; Check: SettingsExistCheck()
Name: "set_default"; Description: "{cm:tsk_SetDefault}"; GroupDescription: "{cm:tsk_Other}"; Check: not DefaulNotepadCheck()
Name: "remove_default"; Description: "{cm:tsk_RemoveDefault}"; GroupDescription: "{cm:tsk_Other}"; Flags: checkedonce unchecked; Check: DefaulNotepadCheck()
Name: "set_openwith"; Description: "{cm:tsk_SetOpenWith}"; GroupDescription: "{cm:tsk_Other}"; Check: not OpenWithCheck()
Name: "remove_openwith"; Description: "{cm:tsk_RemoveOpenWith}"; GroupDescription: "{cm:tsk_Other}"; Flags: checkedonce unchecked; Check: OpenWithCheck()

[Files]
Source: "{#bindir}\Release_x86_v143\Notepad3.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\minipath.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\grepWinNP3.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\np3encrypt.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\License.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Readme.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\grepWinNP3\grepWinLicense.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "Notepad3.ini"; DestDir: "{userappdata}\Rizonesoft\Notepad3"; Flags: onlyifdoesntexist uninsneveruninstall
Source: "minipath.ini"; DestDir: "{userappdata}\Rizonesoft\Notepad3"; Flags: onlyifdoesntexist uninsneveruninstall
Source: "Themes\Dark.ini"; DestDir: "{userappdata}\Rizonesoft\Notepad3\Themes"; Flags: onlyifdoesntexist uninsneveruninstall
Source: "Themes\Obsidian.ini"; DestDir: "{userappdata}\Rizonesoft\Notepad3\Themes"; Flags: onlyifdoesntexist uninsneveruninstall
Source: "Themes\Sombra.ini"; DestDir: "{userappdata}\Rizonesoft\Notepad3\Themes"; Flags: onlyifdoesntexist uninsneveruninstall
Source: "{#bindir}\Release_x86_v143\lng\mplng.dll"; DestDir: "{app}\lng"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\np3lng.dll"; DestDir: "{app}\lng"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\gwLng\*.lang"; DestDir: "{app}\lng\gwLng"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\af-ZA\mplng.dll.mui"; DestDir: "{app}\lng\af-ZA"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\af-ZA\np3lng.dll.mui"; DestDir: "{app}\lng\af-ZA"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\be-BY\mplng.dll.mui"; DestDir: "{app}\lng\be-BY"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\be-BY\np3lng.dll.mui"; DestDir: "{app}\lng\be-BY"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\de-DE\mplng.dll.mui"; DestDir: "{app}\lng\de-DE"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\de-DE\np3lng.dll.mui"; DestDir: "{app}\lng\de-DE"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\el-GR\mplng.dll.mui"; DestDir: "{app}\lng\el-GR"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\el-GR\np3lng.dll.mui"; DestDir: "{app}\lng\el-GR"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\en-GB\mplng.dll.mui"; DestDir: "{app}\lng\en-GB"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\en-GB\np3lng.dll.mui"; DestDir: "{app}\lng\en-GB"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\es-ES\mplng.dll.mui"; DestDir: "{app}\lng\es-ES"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\es-ES\np3lng.dll.mui"; DestDir: "{app}\lng\es-ES"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\es-MX\mplng.dll.mui"; DestDir: "{app}\lng\es-MX"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\es-MX\np3lng.dll.mui"; DestDir: "{app}\lng\es-MX"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\fr-FR\mplng.dll.mui"; DestDir: "{app}\lng\fr-FR"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\fr-FR\np3lng.dll.mui"; DestDir: "{app}\lng\fr-FR"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\hi-IN\mplng.dll.mui"; DestDir: "{app}\lng\hi-IN"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\hi-IN\np3lng.dll.mui"; DestDir: "{app}\lng\hi-IN"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\hu-HU\mplng.dll.mui"; DestDir: "{app}\lng\hu-HU"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\hu-HU\np3lng.dll.mui"; DestDir: "{app}\lng\hu-HU"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\id-ID\mplng.dll.mui"; DestDir: "{app}\lng\id-ID"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\id-ID\np3lng.dll.mui"; DestDir: "{app}\lng\id-ID"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\it-IT\mplng.dll.mui"; DestDir: "{app}\lng\it-IT"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\it-IT\np3lng.dll.mui"; DestDir: "{app}\lng\it-IT"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\ja-JP\mplng.dll.mui"; DestDir: "{app}\lng\ja-JP"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\ja-JP\np3lng.dll.mui"; DestDir: "{app}\lng\ja-JP"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\ko-KR\mplng.dll.mui"; DestDir: "{app}\lng\ko-KR"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\ko-KR\np3lng.dll.mui"; DestDir: "{app}\lng\ko-KR"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\nl-NL\mplng.dll.mui"; DestDir: "{app}\lng\nl-NL"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\nl-NL\np3lng.dll.mui"; DestDir: "{app}\lng\nl-NL"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\pl-PL\mplng.dll.mui"; DestDir: "{app}\lng\pl-PL"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\pl-PL\np3lng.dll.mui"; DestDir: "{app}\lng\pl-PL"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\pt-BR\mplng.dll.mui"; DestDir: "{app}\lng\pt-BR"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\pt-BR\np3lng.dll.mui"; DestDir: "{app}\lng\pt-BR"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\pt-PT\mplng.dll.mui"; DestDir: "{app}\lng\pt-PT"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\pt-PT\np3lng.dll.mui"; DestDir: "{app}\lng\pt-PT"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\ru-RU\mplng.dll.mui"; DestDir: "{app}\lng\ru-RU"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\ru-RU\np3lng.dll.mui"; DestDir: "{app}\lng\ru-RU"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\sk-SK\mplng.dll.mui"; DestDir: "{app}\lng\sk-SK"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\sk-SK\np3lng.dll.mui"; DestDir: "{app}\lng\sk-SK"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\sv-SE\mplng.dll.mui"; DestDir: "{app}\lng\sv-SE"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\sv-SE\np3lng.dll.mui"; DestDir: "{app}\lng\sv-SE"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\tr-TR\mplng.dll.mui"; DestDir: "{app}\lng\tr-TR"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\tr-TR\np3lng.dll.mui"; DestDir: "{app}\lng\tr-TR"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\vi-VN\mplng.dll.mui"; DestDir: "{app}\lng\vi-VN"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\vi-VN\np3lng.dll.mui"; DestDir: "{app}\lng\vi-VN"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\zh-CN\mplng.dll.mui"; DestDir: "{app}\lng\zh-CN"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\zh-CN\np3lng.dll.mui"; DestDir: "{app}\lng\zh-CN"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\zh-TW\mplng.dll.mui"; DestDir: "{app}\lng\zh-TW"; Flags: ignoreversion
Source: "{#bindir}\Release_x86_v143\lng\zh-TW\np3lng.dll.mui"; DestDir: "{app}\lng\zh-TW"; Flags: ignoreversion
Source: "Changes.txt"; DestDir: "{app}\Docs"; Flags: ignoreversion
Source: "Docs\*.txt"; DestDir: "{app}\Docs"; Flags: ignoreversion
Source: "Docs\crypto\*.txt"; DestDir: "{app}\Docs\crypto"; Flags: ignoreversion
Source: "Docs\uthash\*.txt"; DestDir: "{app}\Docs\uthash"; Flags: ignoreversion

[Dirs]
Name: "{userappdata}\Rizonesoft\Notepad3\Favorites"
Name: "{userappdata}\Rizonesoft\Notepad3\Themes"

[Icons]
Name: "{commondesktop}\{#app_name}"; Filename: "{app}\Notepad3.exe"; WorkingDir: "{app}"; AppUserModelID: "{#app_publisher}.{#app_name}"; IconFilename: "{app}\Notepad3.exe"; Comment: "{#app_name} {#app_version}"; Tasks: desktopicon\common
Name: "{userdesktop}\{#app_name}"; Filename: "{app}\Notepad3.exe"; WorkingDir: "{app}"; AppUserModelID: "{#app_publisher}.{#app_name}"; IconFilename: "{app}\Notepad3.exe"; IconIndex: 0; Comment: "{#app_name} {#app_version}"; Tasks: desktopicon\user
Name: "{commonprograms}\{#app_name}"; Filename: "{app}\Notepad3.exe"; WorkingDir: "{app}"; AppUserModelID: "{#app_publisher}.{#app_name}"; IconFilename: "{app}\Notepad3.exe"; IconIndex: 0; Comment: "{#app_name} {#app_version}"; Tasks: startup_icon
Name: "{#quick_launch}\{#app_name}"; Filename: "{app}\Notepad3.exe"; WorkingDir: "{app}"; IconFilename: "{app}\Notepad3.exe"; IconIndex: 0; Comment: "{#app_name} {#app_version}"; Tasks: quicklaunchicon

[INI]
Filename: "{app}\Notepad3.ini"; Section: "Notepad3"; Key: "Notepad3.ini"; String: "%APPDATA%\Rizonesoft\Notepad3\Notepad3.ini"
Filename: "{app}\minipath.ini"; Section: "minipath"; Key: "minipath.ini"; String: "%APPDATA%\Rizonesoft\Notepad3\minipath.ini"
Filename: "{userappdata}\Rizonesoft\Notepad3\Notepad3.ini"; Section: "Settings"; Key: "Favorites"; String: "%APPDATA%\Rizonesoft\Notepad3\Favorites\"

[Registry]
Root: "HKLM"; Subkey: "SYSTEM\CurrentControlSet\Control\FileSystem"; ValueType: dword; ValueName: "LongPathsEnabled"; ValueData: "1"
;The following "Keys/Values" are required to allow a "MS Notepad Replacement" in Windows 11.
Root: "HKLM"; Subkey: "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe"; ValueType: dword; ValueName: "UseFilter"; ValueData: "1"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\App Paths\notepad.exe"; ValueType: string; ValueData: "C:\Windows\System32\Notepad.exe"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\App Paths\notepad.exe"; ValueType: string; ValueName: "Path"; ValueData: "C:\Windows\System32"
Root: "HKCR"; Subkey: ".inf"; ValueType: string; ValueData: "inffile"
Root: "HKCR"; Subkey: ".ini"; ValueType: string; ValueData: "inifile"
Root: "HKCR"; Subkey: ".ps1"; ValueType: string; ValueData: "Microsoft.PowerShellScript.1"
Root: "HKCR"; Subkey: ".psd1"; ValueType: string; ValueData: "Microsoft.PowerShellData.1"
Root: "HKCR"; Subkey: ".psm1"; ValueType: string; ValueData: "Microsoft.PowerShellModule.1"
Root: "HKCR"; Subkey: ".log"; ValueType: string; ValueData: "txtfile"
Root: "HKCR"; Subkey: ".scp"; ValueType: string; ValueData: "txtfile"
Root: "HKCR"; Subkey: ".txt"; ValueType: string; ValueData: "txtfile"
Root: "HKCR"; Subkey: ".wtx"; ValueType: string; ValueData: "txtfile"
Root: "HKCR"; Subkey: "inffile\DefaultIcon"; ValueType: expandsz; ValueData: "%SystemRoot%\System32\imageres.dll,-69"
Root: "HKCR"; Subkey: "inffile\shell\open\command"; ValueType: expandsz; ValueData: "%SystemRoot%\system32\notepad.exe %1"
Root: "HKCR"; Subkey: "inffile\shell\print\command"; ValueType: expandsz; ValueData: "%SystemRoot%\system32\notepad.exe /p %1"
Root: "HKCR"; Subkey: "inifile\DefaultIcon"; ValueType: expandsz; ValueData: "%SystemRoot%\System32\imageres.dll,-69"
Root: "HKCR"; Subkey: "inifile\shell\open\command"; ValueType: expandsz; ValueData: "%SystemRoot%\system32\notepad.exe %1"
Root: "HKCR"; Subkey: "inifile\shell\print\command"; ValueType: expandsz; ValueData: "%SystemRoot%\system32\notepad.exe /p %1"
Root: "HKCR"; Subkey: "Microsoft.PowerShellScript.1\DefaultIcon"; ValueType: expandsz; ValueData: "%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell_ise.exe,1"
Root: "HKCR"; Subkey: "Microsoft.PowerShellScript.1\Shell"; ValueType: string; ValueData: "Open"
Root: "HKCR"; Subkey: "Microsoft.PowerShellScript.1\shell\Open\Command"; ValueType: expandsz; ValueData: "%SystemRoot%\system32\notepad.exe %1"
Root: "HKCR"; Subkey: "Microsoft.PowerShellData.1\DefaultIcon"; ValueType: expandsz; ValueData: "%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell_ise.exe,1"
Root: "HKCR"; Subkey: "Microsoft.PowerShellData.1\Shell"; ValueType: string; ValueData: "Open"
Root: "HKCR"; Subkey: "Microsoft.PowerShellData.1\shell\Open\Command"; ValueType: expandsz; ValueData: "%SystemRoot%\system32\notepad.exe %1"
Root: "HKCR"; Subkey: "Microsoft.PowerShellModule.1\DefaultIcon"; ValueType: expandsz; ValueData: "%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell_ise.exe,1"
Root: "HKCR"; Subkey: "Microsoft.PowerShellModule.1\Shell"; ValueType: string; ValueData: "Open"
Root: "HKCR"; Subkey: "Microsoft.PowerShellModule.1\shell\Open\Command"; ValueType: expandsz; ValueData: "%SystemRoot%\system32\notepad.exe %1"
Root: "HKCR"; Subkey: "txtfile\DefaultIcon"; ValueType: expandsz; ValueData: "%SystemRoot%\system32\imageres.dll,-102"
Root: "HKCR"; Subkey: "txtfile\shell\open\command"; ValueType: expandsz; ValueData: "%SystemRoot%\system32\notepad.exe %1"
Root: "HKCR"; Subkey: "txtfile\shell\print\command"; ValueType: expandsz; ValueData: "%SystemRoot%\system32\notepad.exe /p %1"
Root: "HKCR"; Subkey: "txtfile\shell\printto"; ValueType: string; ValueName: "NeverDefault"
Root: "HKCR"; Subkey: "txtfile\shell\printto\command"; ValueType: expandsz; ValueData: "%SystemRoot%\system32\notepad.exe /pt ""%1"" ""%2"" ""%3"" ""%4"
Root: "HKCR"; Subkey: "txtfilelegacy\DefaultIcon"; ValueType: expandsz; ValueData: "%SystemRoot%\system32\imageres.dll,-102"
Root: "HKCR"; Subkey: "txtfilelegacy\shell\open\command"; ValueType: expandsz; ValueData: "%SystemRoot%\system32\notepad.exe %1"
Root: "HKCR"; Subkey: "txtfilelegacy\shell\print\command"; ValueType: expandsz; ValueData: "%SystemRoot%\system32\notepad.exe /p %1"
Root: "HKCR"; Subkey: "txtfilelegacy\shell\printto"; ValueType: string; ValueName: "NeverDefault"
Root: "HKCR"; Subkey: "txtfilelegacy\shell\printto\command"; ValueType: expandsz; ValueData: "%SystemRoot%\system32\notepad.exe /pt ""%1"" ""%2"" ""%3"" ""%4"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.inf\OpenWithList"; Flags: deletekey
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.inf\UserChoice"; Flags: deletekey
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.inf\OpenWithList"; ValueType: string; ValueName: "a"; ValueData: "Notepad3.exe"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.inf\OpenWithList"; ValueType: string; ValueName: "b"; ValueData: "Notepad.exe"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.inf\OpenWithList"; ValueType: string; ValueName: "MRUList"; ValueData: "ab"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.inf\UserChoice"; ValueType: string; ValueName: "ProgId"; ValueData: "inffile"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.ini\OpenWithList"; Flags: deletekey
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.ini\UserChoice"; Flags: deletekey
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.ini\OpenWithList"; ValueType: string; ValueName: "a"; ValueData: "Notepad3.exe"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.ini\OpenWithList"; ValueType: string; ValueName: "b"; ValueData: "Notepad.exe"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.ini\OpenWithList"; ValueType: string; ValueName: "MRUList"; ValueData: "ab"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.ini\UserChoice"; ValueType: string; ValueName: "ProgId"; ValueData: "inifile"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.ps1\OpenWithList"; Flags: deletekey
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.ps1\UserChoice"; Flags: deletekey
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.ps1\OpenWithList"; ValueType: string; ValueName: "a"; ValueData: "Notepad3.exe"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.ps1\OpenWithList"; ValueType: string; ValueName: "b"; ValueData: "Notepad.exe"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.ps1\OpenWithList"; ValueType: string; ValueName: "MRUList"; ValueData: "ab"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.ps1\UserChoice"; ValueType: string; ValueName: "ProgId"; ValueData: "Microsoft.PowerShellScript.1"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.psd1\OpenWithList"; Flags: deletekey
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.psd1\UserChoice"; Flags: deletekey
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.psd1\OpenWithList"; ValueType: string; ValueName: "a"; ValueData: "Notepad3.exe"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.psd1\OpenWithList"; ValueType: string; ValueName: "b"; ValueData: "Notepad.exe"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.psd1\OpenWithList"; ValueType: string; ValueName: "MRUList"; ValueData: "ab"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.psd1\UserChoice"; ValueType: string; ValueName: "ProgId"; ValueData: "Microsoft.PowerShellData.1"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.psm1\OpenWithList"; Flags: deletekey
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.psm1\UserChoice"; Flags: deletekey
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.psm1\OpenWithList"; ValueType: string; ValueName: "a"; ValueData: "Notepad3.exe"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.psm1\OpenWithList"; ValueType: string; ValueName: "b"; ValueData: "Notepad.exe"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.psm1\OpenWithList"; ValueType: string; ValueName: "MRUList"; ValueData: "ab"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.psm1\UserChoice"; ValueType: string; ValueName: "ProgId"; ValueData: "Microsoft.PowerShellModule.1"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.log\OpenWithList"; Flags: deletekey
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.log\UserChoice"; Flags: deletekey
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.log\OpenWithList"; ValueType: string; ValueName: "a"; ValueData: "Notepad3.exe"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.log\OpenWithList"; ValueType: string; ValueName: "b"; ValueData: "Notepad.exe"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.log\OpenWithList"; ValueType: string; ValueName: "MRUList"; ValueData: "ab"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.log\UserChoice"; ValueType: string; ValueName: "ProgId"; ValueData: "txtfile"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.scp\OpenWithList"; Flags: deletekey
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.scp\UserChoice"; Flags: deletekey
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.scp\OpenWithList"; ValueType: string; ValueName: "a"; ValueData: "Notepad3.exe"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.scp\OpenWithList"; ValueType: string; ValueName: "b"; ValueData: "Notepad.exe"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.scp\OpenWithList"; ValueType: string; ValueName: "MRUList"; ValueData: "ab"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.scp\UserChoice"; ValueType: string; ValueName: "ProgId"; ValueData: "txtfile"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.txt\OpenWithList"; Flags: deletekey
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.txt\UserChoice"; Flags: deletekey
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.txt\OpenWithList"; ValueType: string; ValueName: "a"; ValueData: "Notepad3.exe"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.txt\OpenWithList"; ValueType: string; ValueName: "b"; ValueData: "Notepad.exe"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.txt\OpenWithList"; ValueType: string; ValueName: "MRUList"; ValueData: "ab"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.txt\UserChoice"; ValueType: string; ValueName: "ProgId"; ValueData: "txtfile"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.wtx\OpenWithList"; Flags: deletekey
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.wtx\UserChoice"; Flags: deletekey
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.wtx\OpenWithList"; ValueType: string; ValueName: "a"; ValueData: "Notepad3.exe"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.wtx\OpenWithList"; ValueType: string; ValueName: "b"; ValueData: "Notepad.exe"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.wtx\OpenWithList"; ValueType: string; ValueName: "MRUList"; ValueData: "ab"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.wtx\UserChoice"; ValueType: string; ValueName: "ProgId"; ValueData: "txtfile"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts"; ValueType: dword; ValueName: "Applications\Notepad3.exe_.inf"; ValueData: "0"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts"; ValueType: dword; ValueName: "Applications\Notepad3.exe_.ini"; ValueData: "0"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts"; ValueType: dword; ValueName: "Applications\Notepad3.exe_.ps1"; ValueData: "0"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts"; ValueType: dword; ValueName: "Applications\Notepad3.exe_.psd1"; ValueData: "0"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts"; ValueType: dword; ValueName: "Applications\Notepad3.exe_.psm1"; ValueData: "0"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts"; ValueType: dword; ValueName: "Applications\Notepad3.exe_.log"; ValueData: "0"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts"; ValueType: dword; ValueName: "Applications\Notepad3.exe_.scp"; ValueData: "0"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts"; ValueType: dword; ValueName: "Applications\Notepad3.exe_.txt"; ValueData: "0"
Root: "HKCU"; Subkey: "Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts"; ValueType: dword; ValueName: "Applications\Notepad3.exe_.wtx"; ValueData: "0"

[Run]
Filename: "{app}\Notepad3.exe"; WorkingDir: "{app}"; Flags: nowait postinstall skipifsilent unchecked; Description: "{cm:LaunchProgram,{#app_name}}"
Filename: "https://www.rizonesoft.com/downloads/notepad3/update/"; Flags: nowait postinstall shellexec skipifsilent unchecked; Description: "{cm:tsk_LaunchWelcomePage}"

[InstallDelete]
Type: files; Name: "{userdesktop}\{#app_name}.lnk"; Check: not WizardIsTaskSelected('desktopicon\user') and IsUpgrade()
Type: files; Name: "{commondesktop}\{#app_name}.lnk"; Check: not WizardIsTaskSelected('desktopicon\common') and IsUpgrade()
Type: files; Name: "{userstartmenu}\{#app_name}.lnk"; Check: not WizardIsTaskSelected('startup_icon') and IsUpgrade()
Type: files; Name: "{#quick_launch}\{#app_name}.lnk"; OnlyBelowVersion: 6.01; Check: not WizardIsTaskSelected('quicklaunchicon') and IsUpgrade()
Type: files; Name: "{app}\Notepad3.ini"
Type: files; Name: "{app}\Readme.txt"
Type: files; Name: "{app}\minipath.ini"
Type: files; Name: "{app}\grepWinNP3.ini"

[UninstallDelete]
Type: files; Name: "{app}\Notepad3.ini"
Type: files; Name: "{app}\minipath.ini"
Type: files; Name: "{app}\grepWinNP3.ini"
Type: dirifempty; Name: "{app}"

[Code]
const
  IFEO = 'SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe';
  APPH = 'SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Notepad3.exe';

function InitializeSetup: Boolean;
begin
  Result := True;

   //Check for Processor SSE2 support.
  #if defined(sse2_required)
    if not IsSSE2Supported() then begin
      SuppressibleMsgBox(CustomMessage('msg_simd_sse2'), mbCriticalError, MB_OK, MB_OK);
      Result := False;
    end;
  #elif defined(sse_required)
    if not IsSSESupported() then begin
      SuppressibleMsgBox(CustomMessage('msg_simd_sse'), mbCriticalError, MB_OK, MB_OK);
      Result := False;
    end;
  #endif

end;

// Check if Notepad3 has replaced Windows Notepad
function DefaulNotepadCheck(): Boolean;
var
  sDebugger: String;
begin
  if RegQueryStringValue(HKLM, IFEO, 'Debugger', sDebugger) and
  (sDebugger = (ExpandConstant('"{app}\Notepad3.exe" /z'))) then begin
    Log('Custom Code: {#app_name} is set as the default notepad');
    Result := True;
  end
  else begin
    Log('Custom Code: {#app_name} is NOT set as the default notepad');
    Result := False;
  end;
end;

// Check if "Open with Notepad3" is installed.
function OpenWithCheck(): Boolean;
var
  sOpenWith: String;
begin
  if RegQueryStringValue(HKEY_CLASSES_ROOT, '*\shell\Open with Notepad3', 'Icon', sOpenWith) and
  (sOpenWith = (ExpandConstant('{app}\Notepad3.exe,0'))) then begin
    Log('Custom Code: {#app_name} Open with Notepad3 is set.');
    Result := True;
  end
  else begin
    Log('Custom Code: {#app_name} Open with Notepad3 is not set.');
    Result := False;
  end;
end;

#if defined(sse_required) || defined(sse2_required)
function IsProcessorFeaturePresent(Feature: Integer): Boolean;
external 'IsProcessorFeaturePresent@kernel32.dll stdcall';
#endif

#if defined(sse_required)
function IsSSESupported(): Boolean;
begin
  // PF_XMMI_INSTRUCTIONS_AVAILABLE
  Result := IsProcessorFeaturePresent(6);
end;

#elif defined(sse2_required)

function IsSSE2Supported(): Boolean;
begin
  // PF_XMMI64_INSTRUCTIONS_AVAILABLE
  Result := IsProcessorFeaturePresent(10);
end;

#endif

function IsOldBuildInstalled(sInfFile: String): Boolean;
begin
  if RegKeyExists(HKLM, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Notepad2') and
  FileExists(ExpandConstant('{commonpf}\Notepad2\' + sInfFile)) then
    Result := True
  else
    Result := False;
end;

function IsUpgrade(): Boolean;
var
  sPrevPath: String;
begin
  sPrevPath := WizardForm.PrevAppDir;
  Result := (sPrevPath <> '');
end;

// Check if Notepad3's settings exist
function SettingsExistCheck(): Boolean;
begin
  if FileExists(ExpandConstant('{userappdata}\Rizonesoft\Notepad3\Notepad3.ini')) then begin
    Log('Custom Code: Settings are present');
    Result := True;
  end
  else begin
    Log('Custom Code: Settings are NOT present');
    Result := False;
  end;
end;

function UninstallOldVersion(sInfFile: String): Integer;
var
  iResultCode: Integer;
begin
  // Return Values:
  // 0 - no idea
  // 1 - error executing the command
  // 2 - successfully executed the command

  // default return value
  Result := 0;
  // TODO: use RegQueryStringValue
  if not Exec('rundll32.exe', ExpandConstant('advpack.dll,LaunchINFSectionEx ' + '"{commonpf}\Notepad2\' + sInfFile +'",DefaultUninstall,,8,N'), '', SW_HIDE, ewWaitUntilTerminated, iResultCode) then begin
    Result := 1;
  end
  else begin
    Result := 2;
    Sleep(200);
  end;
end;

function ShouldSkipPage(PageID: Integer): Boolean;
begin
  // Hide the license page if IsUpgrade()
  if IsUpgrade() and (PageID = wpLicense) then
    Result := True;
end;

procedure AddReg();
begin
  RegWriteStringValue(HKCR, 'Applications\notepad3.exe', 'AppUserModelID', 'Rizonesoft.Notepad3');
  RegWriteStringValue(HKCR, 'Applications\notepad3.exe\shell\open\command', '', ExpandConstant('"{app}\Notepad3.exe" "%1"'));
  RegWriteStringValue(HKCR, '*\OpenWithList\notepad3.exe', '', '');
  RegWriteStringValue(HKLM, APPH, '', ExpandConstant('{app}\Notepad3.exe'));
  RegWriteStringValue(HKLM, APPH, 'Path', ExpandConstant('{app}'));
end;

procedure CleanUpSettings();
begin
  DeleteFile(ExpandConstant('{userappdata}\Rizonesoft\Notepad3\Notepad3.ini'));
  DeleteFile(ExpandConstant('{userappdata}\Rizonesoft\Notepad3\minipath.ini'));
  DeleteFile(ExpandConstant('{userappdata}\Rizonesoft\Notepad3\grepWinNP3.ini'));
  DeleteFile(ExpandConstant('{userappdata}\Rizonesoft\Notepad3\Themes\Dark.ini'));
  DeleteFile(ExpandConstant('{userappdata}\Rizonesoft\Notepad3\Themes\Obsidian.ini'));
  DeleteFile(ExpandConstant('{userappdata}\Rizonesoft\Notepad3\Themes\Sombra.ini'));
end;

procedure RemoveReg();
begin
  RegDeleteKeyIncludingSubkeys(HKCR, 'Applications\notepad3.exe');
  RegDeleteKeyIncludingSubkeys(HKCR, '*\OpenWithList\notepad3.exe');
  RegDeleteKeyIncludingSubkeys(HKCR, '*\shell\Open with Notepad3');
  RegDeleteKeyIncludingSubkeys(HKLM, APPH);
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = wpSelectTasks then
    WizardForm.NextButton.Caption := SetupMessage(msgButtonInstall)
  else if CurPageID = wpFinished then
    WizardForm.NextButton.Caption := SetupMessage(msgButtonFinish);
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssInstall then begin
    if WizardIsTaskSelected('reset_settings') then
      CleanUpSettings();

    if IsOldBuildInstalled('Uninstall.inf') or IsOldBuildInstalled('Notepad2.inf') then begin
      if IsOldBuildInstalled('Uninstall.inf') then begin
        Log('Custom Code: The old build is installed, will try to uninstall it');
        if UninstallOldVersion('Uninstall.inf') = 2 then
          Log('Custom Code: The old build was successfully uninstalled')
        else
          Log('Custom Code: Something went wrong when uninstalling the old build');
      end;

      if IsOldBuildInstalled('Notepad2.inf') then begin
        Log('Custom Code: The official Notepad2 build is installed, will try to uninstall it');
        if UninstallOldVersion('Notepad2.inf') = 2 then
          Log('Custom Code: The official Notepad2 build was successfully uninstalled')
        else
          Log('Custom Code: Something went wrong when uninstalling the official Notepad2 build');
      end;

      // This is the case where the old build is installed; the DefaulNotepadCheck() returns true
      // and the set_default task isn't selected
      if not WizardIsTaskSelected('remove_default') then begin
        RegWriteStringValue(HKLM, IFEO, 'Debugger', ExpandConstant('"{app}\Notepad3.exe" /z'));
        RegWriteDWordValue(HKLM, IFEO, 'UseFilter', 0);
      end;
    end;
  end;

  if CurStep = ssPostInstall then begin
    if WizardIsTaskSelected('set_default') then begin
      RegWriteStringValue(HKLM, IFEO, 'Debugger', ExpandConstant('"{app}\Notepad3.exe" /z'));
      RegWriteDWordValue(HKLM, IFEO, 'UseFilter', 0);
    end;
    if WizardIsTaskSelected('remove_default') then begin
      RegDeleteValue(HKLM, IFEO, 'Debugger');
      RegWriteDWordValue(HKLM, IFEO, 'UseFilter', 1);
    end else begin
      If RegValueExists (HKLM, IFEO, 'Debugger') then begin
        RegWriteDWordValue(HKLM, IFEO, 'UseFilter', 0);
      end else begin
        RegWriteDWordValue(HKLM, IFEO, 'UseFilter', 1);
      end;
    end;
    if WizardIsTaskSelected('set_openwith') then begin
      RegWriteStringValue(HKCR, '*\shell\Open with Notepad3', 'Icon', ExpandConstant('{app}\Notepad3.exe,0'));
      RegWriteStringValue(HKCR, '*\shell\Open with Notepad3\command', '', ExpandConstant('"{app}\Notepad3.exe" "%1"'));
    end;
    if WizardIsTaskSelected('remove_openwith') then begin
      RegDeleteKeyIncludingSubkeys(HKCR, '*\shell\Open with Notepad3');
    end;
    // Always add Notepad3's AppUserModelID and the rest registry values
    AddReg();
  end;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
  // When uninstalling, ask the user to delete Notepad3's settings and themes
  if CurUninstallStep = usUninstall then begin
    if SettingsExistCheck() then begin
      if SuppressibleMsgBox(CustomMessage('msg_DeleteSettings'), mbConfirmation, MB_YESNO or MB_DEFBUTTON2, IDNO) = IDYES then
        CleanUpSettings();
    end;
    if DefaulNotepadCheck() then begin
      RegDeleteValue(HKLM, IFEO, 'Debugger');
      RegWriteDWordValue(HKLM, IFEO, 'UseFilter', 1);
    end;
    RemoveReg();
  end;
end;

procedure InitializeWizard();
begin
  WizardForm.SelectTasksLabel.Hide;
  WizardForm.TasksList.Top    := 0;
  WizardForm.TasksList.Height := PageFromID(wpSelectTasks).SurfaceHeight;
end;
