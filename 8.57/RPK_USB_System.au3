#RequireAdmin
#Region ;**** ���������� ACNWrapper_GUI ****
#AutoIt3Wrapper_Icon=ico.ico
#AutoIt3Wrapper_OutFile=EXTS\RepaikUFDSM.2014v8.57.EXE
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUPX=n
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Res_Comment=��ɿ�U��װ������
#AutoIt3Wrapper_Res_Description=��ɿ�U��װ������
#AutoIt3Wrapper_Res_FileVersion=2015.8.57.0329
#AutoIt3Wrapper_Res_LegalCopyright=Copyright (c) 2015 ��ɿ˼�����̳. All Rights Reserved.
#AutoIt3Wrapper_Res_SaveSource=y
#AutoIt3Wrapper_Res_Field=OriginalFilename|��ɿ�U��װ������
#AutoIt3Wrapper_Res_Field=ProductName|��ɿ�U��װ������
#AutoIt3Wrapper_Res_Field=ProductVersion|2015.8.57.0329
#AutoIt3Wrapper_Res_Field=InternalName|��ɿ�U��װ������
#AutoIt3Wrapper_Res_Field=FileDescription|��ɿ�U��װ������
#AutoIt3Wrapper_Res_Field=Comments|��ɿ�U��װ������
#AutoIt3Wrapper_Res_Field=LegalTrademarks|��ɿ˼�����̳
#AutoIt3Wrapper_Res_Field=CompanyName|��ɿ˼�����̳
#AutoIt3Wrapper_Res_Field=PowerBy|��ɿ˼�����̳
#AutoIt3Wrapper_Res_Field=Design|roustar31
#AutoIt3Wrapper_Res_Field=SourceCode|roustar31
#AutoIt3Wrapper_Run_Tidy=y
#EndRegion ;**** ���������� ACNWrapper_GUI ****
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GUIEnhance.au3>
#include <_WinSlide.au3>
#include <WinAPIEx.au3>
#include <WinAPI.au3>
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <ProgressConstants.au3>
#include <StaticConstants.au3>
#include <Constants.au3>
#include <GuiButton.au3>
#include <GuiImageList.au3>
#include <EditConstants.au3>
#include <GDIpProgress.au3>
#include <Date.au3>
#include <waterctrl.dll.au3>
Opt("TrayMenuMode", 1)
Global $showoff = 0
Global $EFIHASH = 0
Global $UEFIYES = 0
If $CmdLine[0] = 1 And $CmdLine[1] = "/export" Then
	export()
	Exit
EndIf
TrayTip("С������ʾ", "�������ڶ��廷��������...", 3, 1)
DirRemove(@TempDir & "\RPK_UPS", 1)
$Kpath = @WindowsDir & "\System32\kernel32.dll"
If FileExists($Kpath) Then
	$OS = StringLeft(FileGetVersion($Kpath), 3)
	Switch $OS
		Case "5.0"
			If @OSArch = "x86" Then
				$OS1 = 50
				$OSVersion = "Microsoft Windows 2000 X86"
			EndIf
		Case "5.1"
			If @OSArch = "x86" Then
				$OS1 = 51
				$OSVersion = "Microsoft Windows XP X86"
			EndIf
			If @OSArch = "x64" Then
				$OS1 = 51
				$OSVersion = "Microsoft Windows XP X64"
			EndIf
		Case "5.2"
			If @OSArch = "x86" Then
				$OS1 = 52
				$OSVersion = "Microsoft Windows 2003 X86"
			EndIf
			If @OSArch = "x64" Then
				$OS1 = 52
				$OSVersion = "Microsoft Windows 2003 X64"
			EndIf
		Case "6.0"
			If @OSArch = "x86" Then
				$OS1 = 60
				$OSVersion = "Microsoft Windows Vista X86"
			EndIf
			If @OSArch = "x64" Then
				$OS1 = 60
				$OSVersion = "Microsoft Windows Vista X64"
			EndIf
		Case "6.1"
			If @OSArch = "x86" Then
				$OS1 = 61
				$OSVersion = "Microsoft Windows 7 X86"
			EndIf
			If @OSArch = "x64" Then
				$OS1 = 61
				$OSVersion = "Microsoft Windows 7 X64"
			EndIf
		Case "6.2"
			If @OSArch = "x86" Then
				$OS1 = 62
				$OSVersion = "Microsoft Windows 8 X86"
			EndIf
			If @OSArch = "x64" Then
				$OS1 = 62
				$OSVersion = "Microsoft Windows 8 X64"
			EndIf
		Case "6.3"
			If @OSArch = "x86" Then
				$OS1 = 63
				$OSVersion = "Microsoft Windows 8.1 X86"
			EndIf
			If @OSArch = "x64" Then
				$OS1 = 63
				$OSVersion = "Microsoft Windows 8.1 X64"
			EndIf
		Case "6.4"
			If @OSArch = "x86" Then
				$OS = 64
				$OSVersion = "Microsoft Windows 10 X86"
			EndIf
			If @OSArch = "x64" Then
				$OS = 64
				$OSVersion = "Microsoft Windows 10 X64"
			EndIf
		Case "10."
			If @OSArch = "x86" Then
				$OS = 100
				$OSVersion = "Microsoft Windows 10 X86"
			EndIf
			If @OSArch = "x64" Then
				$OS = 100
				$OSVersion = "Microsoft Windows 10 X64"
			EndIf
	EndSwitch
EndIf
;MsgBox(64 + 0, "", $OS)
If $OS >= 61 Then
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers", @HomeDrive & "\fbinst.exe", "REG_SZ", "RUNASADMIN WINXPSP3")
EndIf
Local $titile = "��ɿ�U��װ������2014 V8.57 Power By www.repaik.com"
Local $tmpDirs = @TempDir & "\RPK_UPS"
Local $logopic = $tmpDirs & "\LOGO.bmp"
Local $bkpic = $tmpDirs & "\background.gif"
Local $S1 = $tmpDirs & "\S1.bmp"
Local $S2 = $tmpDirs & "\S2.bmp"
Local $P1 = $tmpDirs & "\P1.bmp"
Local $P2 = $tmpDirs & "\P2.bmp"
Local $U1 = $tmpDirs & "\U1.bmp"
Local $U2 = $tmpDirs & "\U2.bmp"
Local $G1 = $tmpDirs & "\G1.bmp"
Local $G2 = $tmpDirs & "\G2.bmp"
Local $E1 = $tmpDirs & "\E1.bmp"
Local $E2 = $tmpDirs & "\E2.bmp"
Local $LS = @DesktopWidth / 2 - 400
Local $HS = -545
Local $HS1 = @DesktopHeight / 2 - 260
Local $LSE = @DesktopWidth + 800
Local $UDUSBYN = "û��U�̺���UDϵͳ��"
If IsAdmin() = "1" Then
	$admin = "������ԱȨ�ޣ�"
Else
	$admin = "����ͨ�û���"
	MsgBox(64 + 0, "����", "  ��⵽���������ڷǹ���ԱȨ�޻�����" & @CR & "�����˳������Ҽ�������ѡ���Թ���Ա������С�")
EndIf
DirCreate($tmpDirs)
Global $tDISK_GEOMETRY_EX, $Drive = 0
Global $CPUpectTF = False
$tDISK_GEOMETRY_EX = _WinAPI_GetDriveGeometryEx($Drive)
While 1
	$tDISK_GEOMETRY_EX = _WinAPI_GetDriveGeometryEx($Drive)
	If @error Then
		ExitLoop
	EndIf
	; ConsoleWrite('-------------------------------' & @CR)
	; ConsoleWrite('Drive: ' & $Drive & @CR)
	; ConsoleWrite('Cylinders: ' & DllStructGetData($tDISK_GEOMETRY_EX, 'Cylinders') & @CR)
	; ConsoleWrite('Tracks per Cylinder: ' & DllStructGetData($tDISK_GEOMETRY_EX, 'TracksPerCylinder') & @CR)
	; ConsoleWrite('Sectors per Track: ' & DllStructGetData($tDISK_GEOMETRY_EX, 'SectorsPerTrack') & @CR)
	; ConsoleWrite('Bytes per Sector: ' & DllStructGetData($tDISK_GEOMETRY_EX, 'BytesPerSector') & ' bytes' & @CR)
	; ConsoleWrite('Total Space: ' & DllStructGetData($tDISK_GEOMETRY_EX, 'DiskSize') & ' bytes' & @CR)
	; ConsoleWrite('-------------------------------' & @CR)
	IniWrite($tmpDirs & "\diskinfo.ini", "disk", $Drive, DllStructGetData($tDISK_GEOMETRY_EX, 'DiskSize'))
	$Drive += 1
WEnd
TrayTip("С������ʾ", "�������ڼ�����Դ�ļ���...", 3, 1)
Local $HDD = IniReadSection($tmpDirs & "\diskinfo.ini", "disk")
FileInstall("background.gif", $bkpic, 1)
FileInstall("LOGO.bmp", $logopic, 1)
FileInstall("gif\S1.bmp", $S1, 1)
FileInstall("gif\S2.bmp", $S2, 1)
FileInstall("gif\P1.bmp", $P1, 1)
FileInstall("gif\P2.bmp", $P2, 1)
FileInstall("gif\U1.bmp", $U1, 1)
FileInstall("gif\U2.bmp", $U2, 1)
FileInstall("gif\G1.bmp", $G1, 1)
FileInstall("gif\G2.bmp", $G2, 1)
FileInstall("gif\E1.bmp", $E1, 1)
FileInstall("gif\E2.bmp", $E2, 1)
FileInstall("rpkusbinfo.ini", $tmpDirs & "\rpkusbinfo.ini", 1)
FileInstall("gif\404.jpg", $tmpDirs & "\404.jpg", 1)
TrayTip("С������ʾ", "�������ڼ�����U������...", 3, 1)
$disk = _disk()
$outdisk = replace0()
$diskarray = StringSplit($outdisk, @CR, 1)
TrayTip("С������ʾ", "�������ڴ������ڿؼ���...", 3, 1)
$GUI = GUICreate("", 800, 545, -1, $HS, $WS_SIZEBOX + $WS_SYSMENU)
GUISetBkColor(0xf0f2f6, $GUI)
For $i = 1 To $diskarray[0]
	$YESUD = StringInStr($diskarray[$i], "*", 0)
Next
If $YESUD = "0" Then
	$UDUSBYN = "��UD"
EndIf
If $YESUD = "1" Then
	$UDUSBYN = "��UD"
EndIf
If $YESUD <> "1" And $YESUD <> "0" Then
	$UDUSBYN = "��UD"
EndIf
$bk = GUICtrlCreatePic($bkpic, 189, 130, 602, 380)
GUICtrlSetState($bk, $GUI_DISABLE)
_WaterCtrl_Startup($logopic, $GUI, '400,50,20,800')
$picsys1 = GUICtrlCreatePic($S2, 10, 160, 162, 48)
$picsys2 = GUICtrlCreatePic($P2, 10, 160 + (1 * 68), 162, 48)
$picsys3 = GUICtrlCreatePic($U1, 10, 160 + (2 * 68), 180, 48)
$picsys5 = GUICtrlCreatePic($E1, 10, 160 + (3 * 68), 162, 48)
$picsys4 = GUICtrlCreatePic($G2, 10, 160 + (4 * 68), 162, 48)
$group1 = GUICtrlCreateGroup("", 200, 140, 579, 360)
$group2 = GUICtrlCreateGroup("", 220, 160, 530, 120)
$group3 = GUICtrlCreateGroup("", 220, 290, 530, 120)
FileInstall("ICO\system.ico", $tmpDirs & "\system.ico", 1)
FileInstall("ICO\MSHDD1.ico", $tmpDirs & "\MSHDD1.ico", 1)
FileInstall("ICO\USB-HDD1.ico", $tmpDirs & "\USB-HDD1.ico", 1)
$SICOMS = GUICtrlCreateIcon($tmpDirs & "\system.ico", -1, 255, 180, 80, 80)
$SICOUP = GUICtrlCreateIcon($tmpDirs & "\MSHDD1.ico", -1, 255, 310, 80, 80)
$Label1 = GUICtrlCreateLabel("��ǰ����ϵͳΪ:  ", 355, 182, 120, 25)
GUICtrlSetFont($Label1, 12, 400)
$Label2 = GUICtrlCreateLabel($OSVersion, 485, 182, 225, 25)
GUICtrlSetFont($Label2, 12, 400)
$Label3 = GUICtrlCreateLabel("��ǰ��½�û�Ϊ:  ", 355, 212, 120, 25)
GUICtrlSetFont($Label3, 12, 400)
$Label4 = GUICtrlCreateLabel(@UserName & $admin, 485, 212, 225, 25)
GUICtrlSetFont($Label4, 12, 400)
$Label5 = GUICtrlCreateLabel("��������ģʽΪ:  ", 355, 242, 130, 25)
GUICtrlSetFont($Label5, 12, 400)
If @OSArch = "x64" Then
	$OSbit = "64λϵͳ"
EndIf
If @OSArch = "x86" Then
	$OSbit = "32λϵͳ"
EndIf
$Label6 = GUICtrlCreateLabel("��" & $OSbit & "��, ������32λģʽ", 485, 242, 225, 25)
GUICtrlSetFont($Label6, 12, 400)
$Label7 = GUICtrlCreateLabel("��������(��U��):  ", 355, 312, 130, 25)
GUICtrlSetFont($Label7, 12, 400)
$Label8 = GUICtrlCreateLabel("һ������" & $HDD[0][0] & "������", 485, 312, 225, 25)
GUICtrlSetFont($Label8, 12, 400)
$Label9 = GUICtrlCreateLabel("U����Ϣ:  ", 355, 342, 70, 25)
GUICtrlSetFont($Label9, 12, 400)
$Combo1 = GUICtrlCreateCombo("", 435, 342, 240, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
For $i = 1 To $diskarray[0]
	GUICtrlSetData($Combo1, $diskarray[$i], $diskarray[$i]) ; default ������һ����һ��fbinst��⵽U���ں���
Next
$Label10 = GUICtrlCreateLabel("�����⵽����U��" & $diskarray[0] & "��," & $UDUSBYN, 355, 372, 365, 25)
GUICtrlSetFont($Label10, 12, 400)
$Label11 = GUICtrlCreateLabel("���ϼ����Ϣֻ���ο�, ���������ʵ�������Windows����ʾΪ׼.", 250, 430, 440, 25)
GUICtrlSetFont($Label11, 10, 400)
$Label12 = GUICtrlCreateLabel("Ϊȷ����������׼ȷ����,Ӧ�������б�����ʱͬʱ���Ӷ��U��.", 250, 460, 440, 25)
GUICtrlSetFont($Label12, 11, 400)
GUICtrlSetColor($Label12, 0xff7700)
;===>ϵͳ��Ϣҳ�涨�����
;===>��ʼ����PE���ҳ��
$groupP1 = GUICtrlCreateGroup("", 200, 140, 579, 360)
$groupP2 = GUICtrlCreateGroup("ʲô��Windwos PE?", 220, 160, 530, 150)
$LabelP1 = GUICtrlCreateLabel("Windows PE��Ӣ��Windows Preinstallation Environment�ļ�ƣ���ΪWindowsԤ��װ����", 245, 185, 480, 25)
$LabelP2 = GUICtrlCreateLabel("��ֻ�������޷������СWin32��ϵͳ�������Ա���ģʽ���е�Windows XP SP3�������ں�", 245, 215, 480, 25)
$LabelP3 = GUICtrlCreateLabel("������Windows��װ����ű����������硢�Զ����������̼�ִ��Ӳ����֤�������С����", 245, 245, 485, 25)
$LabelP4 = GUICtrlCreateLabel("Windows PE�Ա�OEM����似��Ա�㷺ʹ�ã����������ٴ�������ά�������Ӳ����ϵͳ", 245, 275, 480, 25)
$groupP3 = GUICtrlCreateGroup("ʲô��U��װ������?", 220, 330, 530, 150)
$LabelP5 = GUICtrlCreateLabel("U��װ�������ǻ���WinPE��UD��EFI�����Ĳ�Ʒ����λΪ�������װ��ά����Ա��˽������", 245, 355, 480, 25)
$LabelP6 = GUICtrlCreateLabel("ͨ�������˽�װ��ά����Ա�����󣬶�DOS��WinPE�¹��߽�����ѡ����PE�����Խ�����ǿ", 245, 385, 480, 25)
$LabelP7 = GUICtrlCreateLabel("��չWinPE��������ʹ���ܴ����ǿ�������Դ�����ӣ����ܹ���ֹ����ľ���ƻ�����ɾ��", 245, 415, 485, 25)
$LabelP8 = GUICtrlCreateLabel("������ɫ����Ⱦ���������١����ݹ㷺����ݽ�С�������ȶ���ʵ��ά����Ա��˽��С����", 245, 445, 480, 25)
;===>����PE���ҳ�����
;===>��ʼ����U����������ҳ��
$FBAmake = GUICtrlCreateButton("����Fba(&P)", 620, 210, 95, 25)
GUICtrlSetFont($FBAmake, 9, 400)
$groupUQ1 = GUICtrlCreateGroup("", 200, 140, 579, 360)
$groupUQ2 = GUICtrlCreateGroup("�ļ���Ϣ", 220, 160, 530, 82)
$groupUQ3 = GUICtrlCreateGroup("��������", 220, 252, 530, 200)
FileInstall("ICO\fba.ico", $tmpDirs & "\fba.ico", 1)
$UQFBAICO = GUICtrlCreateIcon($tmpDirs & "\fba.ico", -1, 255, 178, 70, 56)
$UQPEICO = GUICtrlCreateIcon($tmpDirs & "\USB-HDD1.ico", -1, 255, 272, 80, 80)
$LabelUQ1 = GUICtrlCreateLabel("��������fba�ļ�����:  Rpkusbfbasource.fba", 355, 182, 350, 25)
GUICtrlSetFont($LabelUQ1, 12, 400)
$LabelUQ2 = GUICtrlCreateLabel("", 355, 212, 0, 0)
GUICtrlSetFont($LabelUQ2, 12, 400)
$LabelUQ3 = GUICtrlCreateLabel("fba�ļ�����С: 368mb;WinPE 8.57", 355, 215, 260, 25)
GUICtrlSetFont($LabelUQ3, 12, 400)
$LabelUQ4 = GUICtrlCreateLabel("Ҫ������U��", 355, 274, 100, 25)
GUICtrlSetFont($LabelUQ4, 12, 400)
$Combousb = GUICtrlCreateCombo("", 460, 274, 250, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
For $i = 1 To $diskarray[0]
	GUICtrlSetData($Combousb, $diskarray[$i], $diskarray[$i]) ; default ������һ����һ��fbinst��⵽U���ں���
Next
$NoMEM = GUICtrlCreateCheckbox("PE����ģʽ", 617, 330, 105, 25)
GUICtrlSetFont($NoMEM, 12, 400)
$LabelUQ5 = GUICtrlCreateLabel("U��������Ϣ", 355, 304, 100, 25)
GUICtrlSetFont($LabelUQ5, 12, 400)
$LabelUQ6 = GUICtrlCreateLabel("", 460, 304, 250, 25)
GUICtrlSetFont($LabelUQ6, 12, 400)
$LabelUQ7 = GUICtrlCreateLabel("��������Ϣ��", 355, 334, 100, 25)
GUICtrlSetFont($LabelUQ7, 12, 400)
$LabelUQ8 = GUICtrlCreateLabel("", 460, 334, 150, 25)
GUICtrlSetFont($LabelUQ8, 12, 400)
$BITLOCK = GUICtrlCreateCheckbox("BitLocker����", 260, 368, 130, 25)
GUICtrlSetFont($BITLOCK, 12, 400)
GUICtrlSetState($BITLOCK, $GUI_CHECKED)
$ATHCN = GUICtrlCreateCheckbox("Acronis True Image", 400, 368, 160, 25)
GUICtrlSetFont($ATHCN, 12, 400)
GUICtrlSetState($ATHCN, $GUI_CHECKED)
$InstallHDD = GUICtrlCreateCheckbox("��װ������ϵͳ", 585, 368, 130, 25)
GUICtrlSetFont($InstallHDD, 12, 400)
$USBmake = GUICtrlCreateButton("��ʼ����(&M)", 265, 410, 100, 32)
GUICtrlSetFont($USBmake, 11, 400)
If GUICtrlRead($Combousb) = "" Then
	GUICtrlSetState($USBmake, $GUI_DISABLE)
EndIf
$USBUpdate = GUICtrlCreateButton("����PE(&U)", 376, 410, 100, 32)
GUICtrlSetFont($USBUpdate, 11, 400)
If $YESUD = "0" Or $YESUD = "1" Then
	GUICtrlSetState($USBUpdate, $GUI_DISABLE)
EndIf
If $YESUD <> "1" And $YESUD <> "0" Then
	FileInstall("ICO\USB-HDD12.ico", $tmpDirs & "\USB-HDD12.ico", 1)
	GUICtrlSetImage($UQPEICO, $tmpDirs & "\USB-HDD12.ico")
EndIf
$USBReset = GUICtrlCreateButton("��ԭU��(&R)", 487, 410, 100, 32)
GUICtrlSetFont($USBReset, 11, 400)
If GUICtrlRead($Combousb) = "" Then
	GUICtrlSetState($USBReset, $GUI_DISABLE)
EndIf
$Exit = GUICtrlCreateButton("�˳�����(&E)", 598, 410, 100, 32)
GUICtrlSetFont($Exit, 11, 400)
$LabelTX = GUICtrlCreateLabel("Ϊȷ����������׼ȷ����,Ӧ�������б�����ʱͬʱ���Ӷ��U��.", 255, 470, 465, 25)
GUICtrlSetFont($LabelTX, 12, 400)
GUICtrlSetColor($LabelTX, 0xff5000)
;===>USB��������ҳ�����
;===>��ʼ����EFI����ҳ��
$groupEF1 = GUICtrlCreateGroup("", 200, 133, 579, 369)
$groupEF2 = GUICtrlCreateGroup("ʲô��UEFI����?", 220, 153, 530, 120)
$LabelEF2 = GUICtrlCreateLabel("UEFIֻ֧��GUID(ȫ��Ψһ��־��)���̷����ṹ����֧�ִӴ�ͳ��MBRӲ�̷�������ϵͳ", 245, 178, 485, 25)
$LabelEF3 = GUICtrlCreateLabel("��Ŀǰ����BIOS���ڴ���ʹ�ã��ʶ���OEM���̵�UEFI��Ԥ����BIOS���ݲ���������MBR", 245, 208, 485, 25)
$LabelEF4 = GUICtrlCreateLabel("��PE��֧��UEFI��������ά����ֻ��Ҫ����ҳ����������л�����ҳ����ж�Ӧ��������", 245, 238, 485, 25)
$groupEF3 = GUICtrlCreateGroup("UEFI������չ", 220, 283, 530, 185)
FileInstall("ICO\USB-uefi.ico", $tmpDirs & "\USB-uefi.ico", 1)
$UEFIICO = GUICtrlCreateIcon($tmpDirs & "\USB-uefi.ico", -1, 245, 318, 80, 80)
$UEFIlabelname = GUICtrlCreateLabel("UEFI��չ�ļ�:", 355, 305, 110, 25)
GUICtrlSetFont($UEFIlabelname, 12, 400)
$UEFIInputname = GUICtrlCreateInput("", 470, 302, 250, 22)
GUICtrlSetState(-1, $GUI_DISABLE)
If FileExists(@ScriptDir & "\RPK.efi") = 1 Then
	GUICtrlSetData($UEFIInputname, "UEFI�����ڳ���������")
EndIf
If FileExists(@ScriptDir & "\RPK.efi") = 0 Then
	GUICtrlSetData($UEFIInputname, "UEFI�����ڳ���������")
EndIf
$UEFIlabelinfo = GUICtrlCreateLabel("��չ�ļ���Ϣ:", 355, 335, 110, 25)
GUICtrlSetFont($UEFIlabelinfo, 12, 400)
$UEFIInputinfo = GUICtrlCreateInput("", 470, 332, 250, 22)
GUICtrlSetState(-1, $GUI_DISABLE)
TrayTip("С������ʾ", "�������ڼ��UEFI��չ����Ϣ...", 3, 1)
If FileGetSize(@ScriptDir & "\RPK.efi") >= 190 * 1048576 Then
	$UEFIsize = Floor(FileGetSize(@ScriptDir & "\RPK.efi") / 1048576)
	$UEFIYES = 1
	GUICtrlSetData($UEFIInputinfo, "WinPE�汾:Win8 X64 EFI 2014.09")
EndIf
If FileGetSize(@ScriptDir & "\RPK.efi") < 190 * 1048576 Then
	$UEFIYES = 0
	GUICtrlSetData($UEFIInputinfo, "WinPE�汾:Win8 X64 EFI 2014.09")
EndIf
;HashEFI()
$UEFIlabeexFat = GUICtrlCreateLabel("U�����ݸ�ʽ:", 355, 365, 110, 25)
GUICtrlSetFont($UEFIlabeexFat, 12, 400)
$UEFIInputexFat = GUICtrlCreateInput("", 470, 362, 250, 22)
GUICtrlSetState(-1, $GUI_DISABLE)
$LabelEF5 = GUICtrlCreateLabel("Ҫ������U��:", 355, 398, 100, 25)
GUICtrlSetFont($LabelEF5, 12, 400)
$Combousbefi = GUICtrlCreateCombo("", 470, 398, 250, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
For $i = 1 To $diskarray[0]
	GUICtrlSetData($Combousbefi, $diskarray[$i], $diskarray[$i]) ; default ������һ����һ��fbinst��⵽U���ں���
Next
$UEFImake = GUICtrlCreateButton("��ʼ����(&M)", 415, 429, 95, 28)
GUICtrlSetFont($USBmake, 11, 400)
$UEFIback = GUICtrlCreateButton("���ص���������ҳ��(&B)", 245, 429, 160, 28)
GUICtrlSetFont($USBUpdate, 11, 400)
$Exituefi = GUICtrlCreateButton("�˳�����(&E)", 520, 429, 95, 28)
GUICtrlSetFont($Exit, 11, 400)
$efimakeISO = GUICtrlCreateButton("����UEFI PE", 625, 429, 95, 28)
GUICtrlSetState($efimakeISO, $GUI_DISABLE)
GUICtrlSetFont($Exit, 11, 400)
$efitip = GUICtrlCreateLabel("", 230, 480, 500, 20)
GUICtrlSetFont($efitip, 11, 400)
GUICtrlSetColor($efitip, 0xff5000)
;===>EFI����ҳ�����
;===>�������̳�ҳ��
$groupUP1 = GUICtrlCreateGroup("", 200, 133, 579, 369)
$groupUP2 = GUICtrlCreateGroup("������", 220, 153, 530, 120)
$EditUP1 = GUICtrlCreateLabel("���ڴ������ȡ�Ƿ����°汾���������Ժ�...", 245, 178, 480, 25)
GUICtrlSetFont($EditUP1, 11, 400)
$EditUP2 = GUICtrlCreateLabel("", 245, 208, 480, 25)
GUICtrlSetFont($EditUP2, 11, 400)
$checkUP = GUICtrlCreateButton("������", 255, 238, 80, 26)
$Newweb = GUICtrlCreateButton("���ʷ���ҳ��", 355, 238, 110, 26)
$Newurl = GUICtrlCreateButton("�������ص�ַ", 485, 238, 110, 26)
$homepage = GUICtrlCreateButton("���ʹٷ���ҳ", 615, 238, 110, 26)
$groupUP3 = GUICtrlCreateGroup("�̳����", 220, 283, 530, 217)
$Tutorialsjpg = GUICtrlCreatePic($tmpDirs & "\404.jpg", 225, 300, 520, 200)
TrayTip("С������ʾ", "�������ڼ��U�������ļ�...", 3, 1)
usbsize()
exfat()
systemhide()
PEinfohide()
UEFIhide()
UPhide()
USBshow()
TrayTip("С������ʾ", "Ԥ������ϣ��������...", 3, 1)
_GUIEnhanceAnimateWin($GUI, 400, $GUI_EN_ANI_FADEIN)
GUICtrlSetDefBkColor(0xf0f2f6)
GUISetState()
TrayTip("", "", 1, 0)
_WinSlide($GUI, $LS, $HS1, 30, 20)
_WinSlide($GUI, $LS, $HS1 + 30, 15, 15)
_WinSlide($GUI, $LS, $HS1, 15, 20)
_GUIEnhanceAnimateTitle($GUI, $titile, $GUI_EN_TITLE_SLIDE)
While 1
	$possys1 = GUIGetCursorInfo($GUI)
	If $possys1[2] = 1 And $possys1[4] = $picsys1 And $possys1[4] <> $picsys2 And $possys1[4] <> $picsys3 And $possys1[4] <> $picsys4 And $possys1[4] <> $picsys5 Then
		PEinfohide()
		USBhide()
		UEFIhide()
		UPhide()
		systemshow()
		GUICtrlSetPos($picsys1, 10, 160, 180, 48)
		GUICtrlSetPos($picsys2, 10, 160 + (1 * 68), 162, 48)
		GUICtrlSetPos($picsys3, 10, 160 + (2 * 68), 162, 48)
		GUICtrlSetPos($picsys4, 10, 160 + (4 * 68), 162, 48)
		GUICtrlSetPos($picsys5, 10, 160 + (3 * 68), 162, 48)
		GUICtrlSetImage($picsys1, $S1)
		GUICtrlSetImage($picsys2, $P2)
		GUICtrlSetImage($picsys3, $U2)
		GUICtrlSetImage($picsys4, $G2)
		GUICtrlSetImage($picsys5, $E1)
	EndIf
	If $possys1[2] = 1 And $possys1[4] <> $picsys1 And $possys1[4] = $picsys2 And $possys1[4] <> $picsys3 And $possys1[4] <> $picsys4 And $possys1[4] <> $picsys5 Then
		systemhide()
		UEFIhide()
		USBhide()
		UPhide()
		PEinfoshow()
		GUICtrlSetImage($picsys1, $S2)
		GUICtrlSetImage($picsys2, $P1)
		GUICtrlSetImage($picsys3, $U2)
		GUICtrlSetImage($picsys4, $G2)
		GUICtrlSetImage($picsys5, $E1)
		GUICtrlSetPos($picsys1, 10, 160, 162, 48)
		GUICtrlSetPos($picsys2, 10, 160 + (1 * 68), 180, 48)
		GUICtrlSetPos($picsys3, 10, 160 + (2 * 68), 162, 48)
		GUICtrlSetPos($picsys4, 10, 160 + (4 * 68), 162, 48)
		GUICtrlSetPos($picsys5, 10, 160 + (3 * 68), 162, 48)
	EndIf
	If $possys1[2] = 1 And $possys1[4] <> $picsys1 And $possys1[4] <> $picsys2 And $possys1[4] = $picsys3 And $possys1[4] <> $picsys4 And $possys1[4] <> $picsys5 Then
		systemhide()
		PEinfohide()
		UEFIhide()
		UPhide()
		USBshow()
		GUICtrlSetImage($picsys1, $S2)
		GUICtrlSetImage($picsys2, $P2)
		GUICtrlSetImage($picsys3, $U1)
		GUICtrlSetImage($picsys4, $G2)
		GUICtrlSetImage($picsys5, $E1)
		GUICtrlSetPos($picsys1, 10, 160, 162, 48)
		GUICtrlSetPos($picsys2, 10, 160 + (1 * 68), 162, 48)
		GUICtrlSetPos($picsys3, 10, 160 + (2 * 68), 180, 48)
		GUICtrlSetPos($picsys4, 10, 160 + (4 * 68), 162, 48)
		GUICtrlSetPos($picsys5, 10, 160 + (3 * 68), 162, 48)
	EndIf
	If $possys1[2] = 1 And $possys1[4] <> $picsys1 And $possys1[4] <> $picsys2 And $possys1[4] <> $picsys3 And $possys1[4] = $picsys4 And $possys1[4] <> $picsys5 Then
		systemhide()
		PEinfohide()
		UEFIhide()
		USBhide()
		UPshow()
		GUICtrlSetImage($picsys1, $S2)
		GUICtrlSetImage($picsys2, $P2)
		GUICtrlSetImage($picsys3, $U2)
		GUICtrlSetImage($picsys4, $G1)
		GUICtrlSetImage($picsys5, $E1)
		GUICtrlSetPos($picsys1, 10, 160, 162, 48)
		GUICtrlSetPos($picsys2, 10, 160 + (1 * 68), 162, 48)
		GUICtrlSetPos($picsys3, 10, 160 + (2 * 68), 162, 48)
		GUICtrlSetPos($picsys4, 10, 160 + (4 * 68), 180, 48)
		GUICtrlSetPos($picsys5, 10, 160 + (3 * 68), 162, 48)
		update()
	EndIf
	If $possys1[2] = 1 And $possys1[4] <> $picsys1 And $possys1[4] <> $picsys2 And $possys1[4] <> $picsys3 And $possys1[4] <> $picsys4 And $possys1[4] = $picsys5 Then
		systemhide()
		USBhide()
		PEinfohide()
		UPhide()
		UEFIshow()
		GUICtrlSetImage($picsys1, $S2)
		GUICtrlSetImage($picsys2, $P2)
		GUICtrlSetImage($picsys3, $U2)
		GUICtrlSetImage($picsys4, $G2)
		GUICtrlSetImage($picsys5, $E2)
		GUICtrlSetPos($picsys1, 10, 160, 162, 48)
		GUICtrlSetPos($picsys2, 10, 160 + (1 * 68), 162, 48)
		GUICtrlSetPos($picsys3, 10, 160 + (2 * 68), 162, 48)
		GUICtrlSetPos($picsys4, 10, 160 + (4 * 68), 162, 48)
		GUICtrlSetPos($picsys5, 10, 160 + (3 * 68), 180, 48)
	EndIf
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $InstallHDD
			If GUICtrlRead($InstallHDD) = $GUI_CHECKED Then
				GUICtrlSetState($USBmake, $GUI_ENABLE)
				GUICtrlSetState($USBReset, $GUI_DISABLE)
				GUICtrlSetState($Combousb, $GUI_DISABLE)
				GUICtrlSetState($NoMEM, $GUI_DISABLE)
				GUICtrlSetState($LabelUQ7, $GUI_DISABLE)
				GUICtrlSetState($LabelUQ8, $GUI_DISABLE)
				GUICtrlSetState($ATHCN, $GUI_UNCHECKED)
				GUICtrlSetState($ATHCN, $GUI_DISABLE)
				GUICtrlSetState($BITLOCK, $GUI_UNCHECKED)
				GUICtrlSetState($BITLOCK, $GUI_DISABLE)
			EndIf
			If GUICtrlRead($InstallHDD) = $GUI_UNCHECKED Then
				GUICtrlSetState($USBmake, $GUI_ENABLE)
				GUICtrlSetState($USBReset, $GUI_ENABLE)
				GUICtrlSetState($LabelUQ7, $GUI_ENABLE)
				GUICtrlSetState($LabelUQ8, $GUI_ENABLE)
				GUICtrlSetState($NoMEM, $GUI_ENABLE)
				GUICtrlSetState($Combousb, $GUI_ENABLE)
				GUICtrlSetState($ATHCN, $GUI_CHECKED)
				GUICtrlSetState($ATHCN, $GUI_ENABLE)
				GUICtrlSetState($BITLOCK, $GUI_CHECKED)
				GUICtrlSetState($BITLOCK, $GUI_ENABLE)
				If $OS <= "5.2" Then;�����NT5.2ϵͳ�����дboot.ini�������ļ����ܰ�װ
					FileSetAttrib(@HomeDrive & "\boot.ini", "-HSR")
					FileCopy(@HomeDrive & "\boot.ini.rpk", @HomeDrive & "\boot.ini", 1)
					DirRemove(@HomeDrive & "\RPK", 1)
					FileSetAttrib(@HomeDrive & "\rpkdr", "-HSR")
					FileSetAttrib(@HomeDrive & "\rpkdr.mbr", "-HSR")
					FileDelete(@HomeDrive & "\rpkdr.mbr")
					FileDelete(@HomeDrive & "\rpkdr")
				EndIf
				If $OS > "5.2" Then;�����Vista������ϵͳ�������BcdEdit�������������
					If Not FileExists(@WindowsDir & "\Bcdedit.exe") Then FileInstall("Bcdedit.exe", @WindowsDir & "\Bcdedit.exe")
					Local $BCDEDIT = @WindowsDir & "\Bcdedit.exe"
					Local $VID = "{F8271F63-1D7F-46BA-A36D-1D192901D0DC}"
					GUICtrlSetData($LabelTX, "  ��ǰ״̬���������PE�����˵�������ϵͳ�У����Ժ�......")
					RunWait(@ComSpec & " /c " & $BCDEDIT & " /delete " & $VID, "", 0)
					ShellExecuteWait($BCDEDIT, "/create " & $VID & " /d  ��ɿ�ά��ϵͳ /application bootsector", @SystemDir, "", 0)
					DirRemove(@HomeDrive & "\RPK", 1)
					FileSetAttrib(@HomeDrive & "\rpkdr", "-HSR")
					FileSetAttrib(@HomeDrive & "\rpkdr.mbr", "-HSR")
					FileDelete(@HomeDrive & "\rpkdr.mbr")
					FileDelete(@HomeDrive & "\rpkdr")
				EndIf
				MsgBox(64 + 0, "����", "�Ѿ��Ƴ���װ������ϵͳ�ϵ���ɿ�װ������PE�˵�������ļ�!", 5)
			EndIf
			
		Case $efimakeISO
			$askmakeiso = MsgBox(32 + 1 + 256, "��ɿ�U��װ������������", "���õ� Win8 X64 PE ��֧��ʹ��UltraISOд��/����������" & @CR & "���������н���װUltraISO 9.6 �ر�棬�뾡����Ҫ�����������" & @CR & "��ȷ��Ҫ�������� Win8 UEFI PE ô����ȷ��������ȡ������", 35)
			If $askmakeiso = 1 And FileExists(@ScriptDir & "\RPK.efi") = 1 Then
				$makebt = GUICtrlGetState($UEFImake)
				GUICtrlSetState($efimakeISO, $GUI_DISABLE)
				GUICtrlSetState($Exituefi, $GUI_DISABLE)
				GUICtrlSetState($UEFIback, $GUI_DISABLE)
				GUICtrlSetState($UEFImake, $GUI_DISABLE)
				TrayTip("С������ʾ", "��������׼�����õ�EFI PE�ļ��У����Ժ�...", 3, 1)
				FileCopy(@ScriptDir & "\RPK.efi", @HomeDrive & "\RPK.exe", 1)
				TrayTip("С������ʾ", "��������չ�����õ�EFI PE�ļ��У����Ժ�...", 3, 1)
				RunWait(@HomeDrive & "\RPK.exe", @HomeDrive, @SW_HIDE)
				FileDelete(@HomeDrive & "\RPK.exe")
				TrayTip("С������ʾ", "��������׼��UltraISO�����У����Ժ�...", 3, 1)
				Sleep(1000)
				TrayTip("С������ʾ", "��������չ��EFI PE��UltraISO�У����Ժ�...", 3, 1)
				FileSetAttrib(@HomeDrive & "\UltraISO\BOOTMGR", "-RSH")
				FileSetAttrib(@HomeDrive & "\UltraISO\boot", "-RSH", 1)
				FileSetAttrib(@HomeDrive & "\UltraISO\efi", "-RSH", 1)
				DirRemove(@HomeDrive & "\UltraISO\boot", 1)
				DirRemove(@HomeDrive & "\UltraISO\efi", 1)
				FileDelete(@HomeDrive & "\UltraISO\BOOTMGR")
				FileCopy(@ProgramFilesDir & "\RPKUEFIPE\BOOTMGR", @HomeDrive & "\UltraISO\BOOTMGR", 1)
				DirCopy(@ProgramFilesDir & "\RPKUEFIPE\boot", @HomeDrive & "\UltraISO\boot", 1)
				DirCopy(@ProgramFilesDir & "\RPKUEFIPE\efi", @HomeDrive & "\UltraISO\efi", 1)
				DirRemove(@ProgramFilesDir & "\RPKUEFIPE", 1)
				FileSetAttrib(@HomeDrive & "\UltraISO\BOOTMGR", "-RSH")
				FileSetAttrib(@HomeDrive & "\UltraISO\boot", "-RSH", 1)
				FileSetAttrib(@HomeDrive & "\UltraISO\efi", "-RSH", 1)
				TrayTip("С������ʾ", "������������UltraISO����EFI PE�����У����Ժ�...", 3, 1)
				ShellExecuteWait(@HomeDrive & "\UltraISO\UltraISO.exe", "-silent -in " & @HomeDrive & "\UltraISO\RPK_WIN8PE_X64.ISO -f  " & @HomeDrive & "\UltraISO\efi -f  " & @HomeDrive & "\UltraISO\boot -f  " & @HomeDrive & "\UltraISO\BOOTMGR -jlong -optimize -volu RPK_UEFI_WIN8X64PE -out " & @HomeDrive & "\UltraISO\RPK_WIN8PE_X64_NEW.ISO", @HomeDrive & "\UltraISO", "")
				Sleep(1000)
				FileDelete(@HomeDrive & "\UltraISO\RPK_WIN8PE_X64.ISO")
				FileDelete(@HomeDrive & "\UltraISO\BOOTMGR")
				DirRemove(@HomeDrive & "\UltraISO\boot", 1)
				DirRemove(@HomeDrive & "\UltraISO\efi", 1)
				TrayTip("С������ʾ", "�������ڽ�������ISO�ļ����Ƶ����棬���Ժ�...", 3, 1)
				FileCopy(@HomeDrive & "\UltraISO\RPK_WIN8PE_X64_NEW.ISO", @DesktopCommonDir & "\RPK_WIN8PE_X64_NEW.ISO", 1)
				FileDelete(@HomeDrive & "\UltraISO\RPK_WIN8PE_X64_NEW.ISO")
				DirRemove(@HomeDrive & "\UltraISO", 1)
				$Newisosizes = FileGetSize(@DesktopCommonDir & "\RPK_WIN8PE_X64_NEW.iso")
				$Newisosize = $Newisosizes / 1048576
				
				If $Newisosize > "207" Then
					TrayTip("С������ʾ", "Win8 EF PE ISO�ļ�������ɣ�����������������ΪRPK_WIN8PE_X64_NEW.iso", 3, 1)
					_WinAPI_ShellChangeNotify($SHCNE_ASSOCCHANGED, $SHCNF_FLUSHNOWAIT)
				Else
					TrayTip("С������ʾ", "��Ǹ��ò������ʧ�ܣ����Ժ����Ի����Թ���ԱȨ�����б�����", 3, 1)
				EndIf
				If FileExists(@ScriptDir & "\RPK.efi") = 0 Or $EFIHASH = 0 Then
					MsgBox(16 + 0, "��ɿ�U��װ������", "����û����ͬĿ¼���ҵ���Ϊ��RPK.efi����չ�ļ�������չ���·Ƿ��۸�" & @CR & "�뵽�ٷ�����ҳ��:http://www.repaik.com/thread-52440-1-1.html������չ��" & "���غ�ŵ��ͱ�����ͬĿ¼������Ϊ:RPK.efi�����ԣ�", 35)
				EndIf
			EndIf
			GUICtrlSetState($Exituefi, $GUI_ENABLE)
			GUICtrlSetState($UEFIback, $GUI_ENABLE)
			If $makebt = "144" Then
				GUICtrlSetState($UEFImake, $GUI_DISABLE)
			EndIf
			If $makebt = "80" Then
				GUICtrlSetState($UEFImake, $GUI_ENABLE)
			EndIf
			GUICtrlSetState($efimakeISO, $GUI_ENABLE)
		Case $FBAmake
			$fbasavedir = FileSelectFolder("��ѡ��Ҫ�����·��", "", 1)
			If $fbasavedir <> "" And $fbasavedir <> @UserProfileDir Then
				GUICtrlSetState($FBAmake, $GUI_DISABLE)
				TrayTip("С������ʾ", "��������׼�����õ�Fba�ļ��У����Ժ�...", 3, 1)
				FileInstall("Rpkusbfbasource.fba", $fbasavedir & "\Rpkusbfbasource.fba", 1)
				TrayTip("С������ʾ", "����Fba�ļ���ɣ�", 3, 1)
				ShellExecute($fbasavedir)
				FileDelete(@UserProfileDir & "\Rpkusbfbasource.fba")
				GUICtrlSetState($FBAmake, $GUI_ENABLE)
			Else
				TrayTip("С������ʾ", "û��ѡ��Ŀ¼����Ŀ¼����������ѡ��Ŀ¼��", 3, 1)
				GUICtrlSetState($FBAmake, $GUI_ENABLE)
			EndIf
		Case $checkUP
			GUICtrlSetState($checkUP, $GUI_DISABLE)
			update()
			GUICtrlSetState($checkUP, $GUI_ENABLE)
		Case $homepage
			ShellExecute("http://www.repaik.com")
		Case $Newweb
			ShellExecute("http://www.repaik.com/thread-52440-1-1.html")
		Case $Newurl
			ShellExecute("http://down.repaik.com/PESecretary")
		Case $GUI_EVENT_CLOSE
			ExitProgram()
		Case $Combousb
			usbsize()
		Case $Combousbefi
			exfat()
		Case $Exit
			ExitProgram()
		Case $Exituefi
			ExitProgram()
		Case $UEFIback
			systemhide()
			PEinfohide()
			UEFIhide()
			USBshow()
			GUICtrlSetImage($picsys1, $S2)
			GUICtrlSetImage($picsys2, $P2)
			GUICtrlSetImage($picsys3, $U1)
			GUICtrlSetImage($picsys4, $G2)
			GUICtrlSetImage($picsys5, $E1)
			GUICtrlSetPos($picsys1, 10, 160, 162, 48)
			GUICtrlSetPos($picsys2, 10, 160 + (1 * 68), 162, 48)
			GUICtrlSetPos($picsys3, 10, 160 + (2 * 68), 180, 48)
			GUICtrlSetPos($picsys4, 10, 160 + (4 * 68), 162, 48)
			GUICtrlSetPos($picsys5, 10, 160 + (3 * 68), 162, 48)
		Case $UEFImake
			;===>������
			exfat()
			$uefistate = GUICtrlRead($UEFIInputname)
			$askuefi = MsgBox(32 + 1 + 256, "��ɿ�U��װ������������", "������ɺ�U�̽����ô�UEFIģʽ��������֧��UEFI�̼�������" & @CR & "����������ǰȷ��U��ʣ��ռ�����350MB" & @CR & "��ȷ��Ҫ��ʼ����UEFI��չ����֧����", 35)
			If $askuefi = 1 Then
				;$fbdrives = StringRegExp(GUICtrlRead($Combousbefi), '(?<=\()[^)]+', 1);ʹ��������ʽ����Combousbefi�ؼ��е��ַ������õ�������hdx�������ַ���
				GUICtrlSetState($UEFImake, $GUI_HIDE)
				GUICtrlSetState($UEFIback, $GUI_HIDE)
				GUICtrlSetState($Exituefi, $GUI_HIDE)
				GUICtrlSetState($efimakeISO, $GUI_HIDE)
				GUICtrlSetState($picsys1, $GUI_DISABLE)
				GUICtrlSetState($picsys2, $GUI_DISABLE)
				GUICtrlSetState($picsys3, $GUI_DISABLE)
				GUICtrlSetState($picsys4, $GUI_DISABLE)
				GUICtrlSetState($picsys5, $GUI_DISABLE)
				GUICtrlSetState($Combousbefi, $GUI_DISABLE)
				
				$uefiprogress = _ProgressCreate(275, 432, 410, 22)
				_ProgressSetText($uefiprogress, "%P%%")
				_ProgressSetImages($uefiprogress, $tmpDirs & "\red.jpg", $tmpDirs & "\bg.jpg")
				_ProgressSetFont($uefiprogress, "", -1, -1, 0x339966)
				_ProgressSet($uefiprogress, 10)
				GUICtrlSetData($efitip, "  ��ǰ״̬��������ȡUEFI������У����Ժ�......")
				;$fbdrive = StringRight($fbdrives[0], 1);��ȡ���������ַ���������ұ߿�ʼ��һ����һ�����Win�µ�Ӳ�̱��,Ҳ����fibinst��U�̱�ʾ����
				FileInstall("Rpkusbfbasource.fba", @HomeDrive & "\Rpkusbfbasource.fba", 1)
				_ProgressSet($uefiprogress, 10)
				
				FileInstall("fbinst.exe", @HomeDrive & "\fbinst.exe", 1)
				;����fbinst.exe��fbaԴ�ļ���ȡ����win8 x64 pe��ISO�ļ�����ȡ��ϵͳ�̸�Ŀ¼�£���ҪΪ�˱��ⲻ��Ҫ�Ŀո�
				DirRemove(@HomeDrive & "\RPK", 1)
				DirCreate(@HomeDrive & "\RPK")
				RunWait(@HomeDrive & '\fbinst.exe' & @HomeDrive & '/Rpkusbfbasource.fba output boot/08PE.iso ' & @HomeDrive & '/RPK/', @HomeDrive, @SW_HIDE)
				If Not FileExists(@HomeDrive & "\RPK\boot\08PE.iso") Then RunWait(@ComSpec & " /c " & "fbinst.exe Rpkusbfbasource.fba output boot/08PE.iso %SystemDrive%/RPK/", @HomeDrive, @SW_HIDE)
				;RunWait($TempDir & '\7z.exe x "' & $TempDir & '\chrome.7z" -y', $TempDir, @SW_HIDE)
				FileDelete(@HomeDrive & "\fbinst.exe")
				FileDelete(@HomeDrive & "\Rpkusbfbasource.fba")
				GUICtrlSetData($efitip, "  ��ǰ״̬������չ��UEFI������У����Ժ�......")
				;��ʼʹ��7z��ѹȡ������Win8PE��ISO
				FileInstall("7z.exe", @HomeDrive & "\RPK\boot\7z.exe", 1)
				FileInstall("7z.dll", @HomeDrive & "\RPK\boot\7z.dll", 1)
				;ע�⣬����Ŀ¼���������7z.exe�����г���һ�£������ܽ�ѹ��
				RunWait(@HomeDrive & '\RPK\boot\7z.exe x "' & @HomeDrive & '\RPK\boot\08PE.iso" -y', @HomeDrive & '\RPK\boot', @SW_HIDE)
				FileDelete(@HomeDrive & "\RPK\boot\7z.exe")
				FileDelete(@HomeDrive & "\RPK\boot\7z.dll")
				FileDelete(@HomeDrive & "\RPK\boot\08PE.iso")
				GUICtrlSetData($efitip, "  ��ǰ״̬�����ڶ�ȡĿ��U���ļ�ϵͳ�����Ժ�......")
				_ProgressSet($uefiprogress, 20)
				$fbpanfus = StringStripWS(GUICtrlRead($Combousbefi), 8);ǿ��ɾ����ȡ�����ַ����е����пո�
				$fbpanfu = StringRight($fbpanfus, 2);��ȡɾ���ո����ַ������ұ߿�ʼ��2���ַ�
				;MsgBox(64 + 0, "", $fbpanfu)
				GUICtrlSetData($efitip, "��ǰ״̬�����ڴ���Ŀ������ļ�ϵͳ�����Ժ�......")
				FileSetAttrib($fbpanfu & "\BOOTMGR", "-RSH")
				FileSetAttrib($fbpanfu & "\boot", "-RSH", 1)
				FileSetAttrib($fbpanfu & "\SOURCES", "-RSH", 1)
				FileSetAttrib($fbpanfu & "\efi", "-RSH", 1)
				FileDelete($fbpanfu & "\BOOTMGR")
				DirRemove($fbpanfu & "\boot", 1)
				DirRemove($fbpanfu & "\efi", 1)
				DirRemove($fbpanfu & "\SOURCES", 1)
				_ProgressSet($uefiprogress, 30)
				GUICtrlSetData($efitip, "��ǰ״̬�����ڸ���UEFI��չ�ļ���Ŀ��U�̣����Ժ�......")
				FileCopy(@HomeDrive & "\RPK\boot\BOOTMGR", $fbpanfu & "\BOOTMGR", 1)
				_ProgressSet($uefiprogress, 35)
				DirCopy(@HomeDrive & "\RPK\boot\boot", $fbpanfu & "\boot", 1)
				_ProgressSet($uefiprogress, 45)
				DirCopy(@HomeDrive & "\RPK\boot\efi", $fbpanfu & "\efi", 1)
				_ProgressSet($uefiprogress, 55)
				DirCopy(@HomeDrive & "\RPK\boot\SOURCES", $fbpanfu & "\SOURCES", 1)
				_ProgressSet($uefiprogress, 75)
				FileSetAttrib($fbpanfu & "\boot", "+RSH", 1)
				FileSetAttrib($fbpanfu & "\efi", "+RSH", 1)
				FileSetAttrib($fbpanfu & "\SOURCES", "+RSH", 1)
				FileSetAttrib($fbpanfu & "\BOOTMGR", "+RSH")
				_ProgressSet($uefiprogress, 95)
				Sleep(1000)
				_ProgressSet($uefiprogress, 100)
				GUICtrlSetState($efimakeISO, $GUI_SHOW)
				GUICtrlSetState($UEFImake, $GUI_SHOW)
				GUICtrlSetState($UEFIback, $GUI_SHOW)
				GUICtrlSetState($Exituefi, $GUI_SHOW)
				GUICtrlSetState($picsys1, $GUI_ENABLE)
				GUICtrlSetState($picsys2, $GUI_ENABLE)
				GUICtrlSetState($picsys3, $GUI_ENABLE)
				GUICtrlSetState($picsys4, $GUI_ENABLE)
				GUICtrlSetState($picsys5, $GUI_ENABLE)
				GUICtrlSetState($Combousbefi, $GUI_ENABLE)
				DirRemove(@HomeDrive & "\RPK", 1)
				FileDelete(@ScriptDir & "\Rpkusbfbasource.fba")
				_ProgressDelete($uefiprogress)
				GUICtrlSetData($efitip, "����ȫ����ɣ�������˳�����������ɿ���̳���н���ѧϰ")
				;===>������
			EndIf
		Case $USBUpdate
			If GUICtrlRead($ATHCN) = $GUI_CHECKED Then
				Local $ATIHCNYES = 1
			EndIf
			If GUICtrlRead($ATHCN) = $GUI_UNCHECKED Then
				Local $ATIHCNYES = 0
			EndIf
			If GUICtrlRead($BITLOCK) = $GUI_CHECKED Then
				Local $BITLOCKYES = 1
			EndIf
			If GUICtrlRead($BITLOCK) = $GUI_UNCHECKED Then
				Local $BITLOCKYES = 0
			EndIf
			$Driveifstars = GUICtrlRead($Combousb)
			$DriveTsizess = StringRegExp(GUICtrlRead($Combousb), '(?<=\()[^)]+', 1);ʹ��������ʽ����Combousb�ؼ��е��ַ������õ�������hdx�������ַ���
			$DriveTsizes = StringRight($DriveTsizess[0], 1);��ȡ���������ַ���������ұ߿�ʼ��һ����һ�����Win�µ�Ӳ�̱��;Ҳ����fbinst��Ӳ�̱��
			$panfus = StringStripWS(GUICtrlRead($Combousb), 8);ǿ��ɾ����ȡ�����ַ����е����пո�
			$panfu = StringRight($panfus, 2);��ȡɾ���ո����ַ������ұ߿�ʼ��2���ַ�
			$usbsize = Floor(DriveSpaceTotal($panfu));ʹ��AU3��ȡWin�¿ɼ��ռ��С
			FileInstall("fbinst.exe", @HomeDrive & "\fbinst.exe", 1)
			If FileExists(@HomeDrive & '\udinfos.txt') Then FileDelete(@HomeDrive & '\udinfos.txt')
			If FileExists(@ScriptDir & '\udinfos.txt') Then FileDelete(@ScriptDir & '\udinfos.txt')
			RunWait(@ComSpec & ' /c ' & @HomeDrive & '\fbinst (hd' & $DriveTsizes & ') info > ' & @HomeDrive & '\udinfos.txt', @HomeDrive, @SW_HIDE)
			If FileGetSize(@HomeDrive & '\udinfos.txt') > 10 Then
				Local $fileopen = FileOpen(@HomeDrive & '\udinfos.txt')
				Local $fileread = FileReadLine($fileopen, 5)
				Local $filestrings2 = StringSplit(StringStripWS($fileread, 8), ":")
				Local $USBUDSIZE2 = $filestrings2[2] / 2048
				Local $DriveTsize = $USBUDSIZE2 + 8 + $usbsize
				FileClose($fileopen)
			EndIf
			If FileGetSize(@HomeDrive & '\udinfos.txt') < 10 Then
				Local $USBUDSIZE2 = "0"
				Local $DriveTsize = $usbsize
			EndIf
			;����ֻ��ʹ��bootice����֤����Ҫ���ȸ���bootice.exe��C�̸�Ŀ¼��
			;RunWait('cmd.exe  /c  C:\bootice.exe  /DEVICE=' & $panfu & ' /diskinfo /file=C:\diskinfo.ini', "C:\", @SW_HIDE)
			GUICtrlSetData($LabelUQ6, "��������" & $DriveTsize & "MB �ɼ�����" & $usbsize & "MB")
			$fbinstHDx = "(hd" & $DriveTsizes & ")"
			FileInstall("fbinst.exe", @HomeDrive & "\fbinst.exe", 1)
			;$foo=ShellExecuteWait ('C:\fbinst.exe',$fbinstHDx & ' filelist', @ScriptDir,"", @SW_HIDE)
			;$UDtotal = Round($foo/1024);�õ�UD�����ļ��ܴ�С
			;MsgBox(64+0,"",$UDtotal)
			;MsgBox(64+0,"",$UDSIZEi)
			If StringInStr($Driveifstars, "*", 0) <> 0 And $USBUDSIZE2 > 380 Then
				$askusb7 = MsgBox(32 + 1 + 256, "����", "��⵽���U���к��к��ʿռ��UD�����ɽ���������װ�����ᶪʧU������" & @CR & "��ȷ��Ҫ����������������ô����ȷ��������ȡ������")
				If $askusb7 = 1 Then
					GUICtrlSetState($USBmake, $GUI_HIDE)
					GUICtrlSetState($USBReset, $GUI_HIDE)
					GUICtrlSetState($USBUpdate, $GUI_HIDE)
					GUICtrlSetState($Exit, $GUI_HIDE)
					GUICtrlSetState($picsys1, $GUI_DISABLE)
					GUICtrlSetState($picsys2, $GUI_DISABLE)
					GUICtrlSetState($picsys3, $GUI_DISABLE)
					GUICtrlSetState($picsys4, $GUI_DISABLE)
					GUICtrlSetState($picsys5, $GUI_DISABLE)
					GUICtrlSetState($Combousb, $GUI_DISABLE)
					GUICtrlSetState($NoMEM, $GUI_DISABLE)
					GUICtrlSetState($InstallHDD, $GUI_DISABLE)
					GUICtrlSetState($BITLOCK, $GUI_DISABLE)
					GUICtrlSetState($ATHCN, $GUI_DISABLE)
					GUICtrlSetState($FBAmake, $GUI_DISABLE)
					FileInstall("gif\red.jpg", $tmpDirs & "\red.jpg", 1)
					FileInstall("gif\bg.jpg", $tmpDirs & "\bg.jpg", 1)
					$uefiprogress = _ProgressCreate(275, 422, 410, 22)
					_ProgressSetText($uefiprogress, "%P%%")
					_ProgressSetImages($uefiprogress, $tmpDirs & "\red.jpg", $tmpDirs & "\bg.jpg")
					_ProgressSetFont($uefiprogress, "", -1, -1, 0x339966)
					_ProgressSet($uefiprogress, 10)
					GUICtrlSetData($LabelTX, "��ǰ״̬������׼���ر������ļ������������У����Ժ�......")
					FileInstall("fbinst.exe", @HomeDrive & "\fbinst.exe", 1)
					_ProgressSet($uefiprogress, 35)
					FileInstall("Rpkusbfbasource.fba", @HomeDrive & "\Rpkusbfbasource.fba", 1)
					_ProgressSet($uefiprogress, 45)
					GUICtrlSetData($LabelTX, "��ǰ״̬�����ڽ���PEд��Ŀ��U��UD�����У����Ժ�......")
					ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' clear', @HomeDrive, '', @SW_HIDE)
					ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' load ' & @HomeDrive & '/Rpkusbfbasource.fba', @HomeDrive, '', @SW_HIDE)
					GUICtrlSetData($LabelTX, "��ǰ״̬�����ڽ�ѡ��ĸ��ӹ���д��Ŀ��U���У����Ժ�......")
					_ProgressSet($uefiprogress, 65)
					If $ATIHCNYES = 1 Then
						FileInstall("ATI5539CN.7z", @HomeDrive & "\ATI5539CN.7z", 1)
						_ProgressSet($uefiprogress, 70)
						ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' add --extended EXTS/ATI5539CN.7z ' & @HomeDrive & '/ATI5539CN.7z', @HomeDrive, '', @SW_HIDE)
						_ProgressSet($uefiprogress, 75)
					EndIf
					If $BITLOCKYES = 1 Then
						FileInstall("BITLOCKER.7z", @HomeDrive & "\BITLOCKER.7z", 1)
						_ProgressSet($uefiprogress, 80)
						ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' add --extended EXTS/BITLOCKER.7z ' & @HomeDrive & '/BITLOCKER.7z', @HomeDrive, '', @SW_HIDE)
						_ProgressSet($uefiprogress, 85)
					EndIf
					If GUICtrlRead($NoMEM) = $GUI_CHECKED Then
						GUICtrlSetData($LabelTX, "��ǰ״̬�����ڵ���PE�ļ��ط�ʽ���м��ټ��أ����Ժ�......")
						_ProgressSet($uefiprogress, 90)
						FileInstall("menu.lst", @HomeDrive & "\menu.lst", 1)
						ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' add --extended menu.lst ' & @HomeDrive & '/menu.lst', @HomeDrive, '', @SW_HIDE)
						Sleep(1000)
						FileDelete(@HomeDrive & "\menu.lst")
					EndIf
					$NewUDsizes = ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' filelist', @HomeDrive, '', @SW_HIDE)
					$NewUDsize = Round($NewUDsizes / 1024)
					If $NewUDsize < 10 Then
						MsgBox(16 + 0, "��Ǹ", "����ʧ��! ���˳��������²���U������!", 35)
					Else
						MsgBox(64 + 0, "��ϲ", "�����ɹ��������ѡ��ȫ�Ƴ�U�̻��߽���UEFI����������", 35)
					EndIf
					GUICtrlSetData($LabelTX, "�����ɹ�������԰�ȫ�Ƴ�U���˳���������UEFI��������")
					Sleep(1000)
					_ProgressSet($uefiprogress, 100)
					GUICtrlSetState($USBmake, $GUI_SHOW)
					GUICtrlSetState($USBReset, $GUI_SHOW)
					GUICtrlSetState($USBUpdate, $GUI_SHOW)
					GUICtrlSetState($Exit, $GUI_SHOW)
					GUICtrlSetState($picsys1, $GUI_ENABLE)
					GUICtrlSetState($picsys2, $GUI_ENABLE)
					GUICtrlSetState($picsys3, $GUI_ENABLE)
					GUICtrlSetState($picsys4, $GUI_ENABLE)
					GUICtrlSetState($picsys5, $GUI_ENABLE)
					GUICtrlSetState($Combousb, $GUI_ENABLE)
					GUICtrlSetState($NoMEM, $GUI_ENABLE)
					GUICtrlSetState($InstallHDD, $GUI_ENABLE)
					GUICtrlSetState($BITLOCK, $GUI_ENABLE)
					GUICtrlSetState($ATHCN, $GUI_ENABLE)
					GUICtrlSetState($FBAmake, $GUI_ENABLE)
					_ProgressDelete($uefiprogress)
					GUICtrlSetData($LabelUQ8, "UD:420M|����:" & $NewUDsize & "M");������UD����Сд��label�ؼ�
					usbsize()
				Else
				EndIf
			EndIf
			If StringInStr($Driveifstars, "*", 0) <> 0 And $USBUDSIZE2 <= 380 Then
				MsgBox(64 + 0, "����", "��⵽���U���е�UD����С���ʺ�������װ��" & @CR & "ֻ��ʹ��ȫ���������ߵ���fba�ļ�����������.", 35)
			EndIf
		Case $USBmake
			If GUICtrlRead($InstallHDD) = $GUI_CHECKED Then
				InstallHDD()
			EndIf
			If GUICtrlRead($InstallHDD) = $GUI_UNCHECKED Then
				If GUICtrlRead($ATHCN) = $GUI_CHECKED Then
					Local $ATIHCNYES = 1
				EndIf
				If GUICtrlRead($ATHCN) = $GUI_UNCHECKED Then
					Local $ATIHCNYES = 0
				EndIf
				If GUICtrlRead($BITLOCK) = $GUI_CHECKED Then
					Local $BITLOCKYES = 1
				EndIf
				If GUICtrlRead($BITLOCK) = $GUI_UNCHECKED Then
					Local $BITLOCKYES = 0
				EndIf
				$Driveifstars = GUICtrlRead($Combousb)
				$DriveTsizess = StringRegExp(GUICtrlRead($Combousb), '(?<=\()[^)]+', 1);ʹ��������ʽ����Combousb�ؼ��е��ַ������õ�������hdx�������ַ���
				$DriveTsizes = StringRight($DriveTsizess[0], 1);��ȡ���������ַ���������ұ߿�ʼ��һ����һ�����Win�µ�Ӳ�̱��;Ҳ����fbinst��Ӳ�̱��
				$panfus = StringStripWS(GUICtrlRead($Combousb), 8);ǿ��ɾ����ȡ�����ַ����е����пո�
				$panfu = StringRight($panfus, 2);��ȡɾ���ո����ַ������ұ߿�ʼ��2���ַ�
				$usbsize = Floor(DriveSpaceTotal($panfu));ʹ��AU3��ȡWin�¿ɼ��ռ��С
				FileInstall("fbinst.exe", @HomeDrive & "\fbinst.exe", 1)
				If FileExists(@HomeDrive & '\udinfos.txt') Then FileDelete(@HomeDrive & '\udinfos.txt')
				If FileExists(@ScriptDir & '\udinfos.txt') Then FileDelete(@ScriptDir & '\udinfos.txt')
				RunWait(@ComSpec & ' /c ' & @HomeDrive & '\fbinst (hd' & $DriveTsizes & ') info > ' & @HomeDrive & '\udinfos.txt', @HomeDrive, @SW_HIDE)
				If FileGetSize(@HomeDrive & '\udinfos.txt') > 10 Then
					Local $fileopen = FileOpen(@HomeDrive & '\udinfos.txt')
					Local $fileread = FileReadLine($fileopen, 5)
					Local $filestrings2 = StringSplit(StringStripWS($fileread, 8), ":")
					Local $USBUDSIZE2 = $filestrings2[2] / 2048
					Local $DriveTsize = $USBUDSIZE2 + 8 + $usbsize
					FileClose($fileopen)
				EndIf
				If FileGetSize(@HomeDrive & '\udinfos.txt') < 10 Then
					Local $USBUDSIZE2 = "0"
					Local $DriveTsize = $usbsize
				EndIf
				;����ֻ��ʹ��bootice����֤����Ҫ���ȸ���bootice.exe��C�̸�Ŀ¼��
				;RunWait('cmd.exe  /c  C:\bootice.exe  /DEVICE=' & $panfu & ' /diskinfo /file=C:\diskinfo.ini', "C:\", @SW_HIDE)
				GUICtrlSetData($LabelUQ6, "��������" & $DriveTsize & "MB �ɼ�����" & $usbsize & "MB")
				$fbinstHDx = "(hd" & $DriveTsizes & ")"
				FileInstall("fbinst.exe", @HomeDrive & "\fbinst.exe", 1)
				;$foo=ShellExecuteWait ('C:\fbinst.exe',$fbinstHDx & ' filelist', @ScriptDir,"", @SW_HIDE)
				;$UDtotal = Round($foo/1024);�õ�UD�����ļ��ܴ�С
				;MsgBox(64+0,"",$UDtotal)
				;MsgBox(64+0,"",$UDSIZEi)
				If StringInStr($Driveifstars, "*", 0) <> 0 And $USBUDSIZE2 > 380 Then
					$askusb1 = MsgBox(32 + 1 + 256, "����", "��⵽���U���к��к��ʿռ��UD�����ɽ���������װ" & @CR & "��ȷ��Ҫ����������װ����������ȫ������ô����ȷ��������ȡ������")
					If $askusb1 = 1 Then
						GUICtrlSetState($USBmake, $GUI_HIDE)
						GUICtrlSetState($USBReset, $GUI_HIDE)
						GUICtrlSetState($USBUpdate, $GUI_HIDE)
						GUICtrlSetState($Exit, $GUI_HIDE)
						GUICtrlSetState($picsys1, $GUI_DISABLE)
						GUICtrlSetState($picsys2, $GUI_DISABLE)
						GUICtrlSetState($picsys3, $GUI_DISABLE)
						GUICtrlSetState($picsys4, $GUI_DISABLE)
						GUICtrlSetState($picsys5, $GUI_DISABLE)
						GUICtrlSetState($Combousb, $GUI_DISABLE)
						GUICtrlSetState($NoMEM, $GUI_DISABLE)
						GUICtrlSetState($InstallHDD, $GUI_DISABLE)
						GUICtrlSetState($BITLOCK, $GUI_DISABLE)
						GUICtrlSetState($ATHCN, $GUI_DISABLE)
						GUICtrlSetState($FBAmake, $GUI_DISABLE)
						FileInstall("gif\red.jpg", $tmpDirs & "\red.jpg", 1)
						FileInstall("gif\bg.jpg", $tmpDirs & "\bg.jpg", 1)
						$uefiprogress = _ProgressCreate(275, 422, 410, 22)
						_ProgressSetText($uefiprogress, "%P%%")
						_ProgressSetImages($uefiprogress, $tmpDirs & "\red.jpg", $tmpDirs & "\bg.jpg")
						_ProgressSetFont($uefiprogress, "", -1, -1, 0x339966)
						_ProgressSet($uefiprogress, 10)
						GUICtrlSetData($LabelTX, "��ǰ״̬������׼���ر������ļ������������У����Ժ�......")
						FileInstall("fbinst.exe", @HomeDrive & "\fbinst.exe", 1)
						_ProgressSet($uefiprogress, 15)
						FileInstall("Rpkusbfbasource.fba", @HomeDrive & "\Rpkusbfbasource.fba", 1)
						_ProgressSet($uefiprogress, 35)
						GUICtrlSetData($LabelTX, "��ǰ״̬�����ڸ�ʽ��Ŀ��U�̲�д�����������У����Ժ�......")
						ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' format --raw --force', @HomeDrive, '', @SW_HIDE)
						_ProgressSet($uefiprogress, 45)
						GUICtrlSetData($LabelTX, "��ǰ״̬�����ڽ�Ŀ��U�̷�����д����Ҫ�����У����Ժ�......")
						ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' format --extended 420m --force --align --fat32 --primary 8m --archive ' & @HomeDrive & '/Rpkusbfbasource.fba', @HomeDrive, '', @SW_HIDE)
						GUICtrlSetData($LabelTX, "��ǰ״̬�����ڽ�ѡ��ĸ��ӹ���д��Ŀ��U���У����Ժ�......")
						_ProgressSet($uefiprogress, 65)
						If $ATIHCNYES = 1 Then
							FileInstall("ATI5539CN.7z", @HomeDrive & "\ATI5539CN.7z", 1)
							_ProgressSet($uefiprogress, 70)
							ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' add --extended EXTS/ATI5539CN.7z ' & @HomeDrive & '/ATI5539CN.7z', @HomeDrive, '', @SW_HIDE)
							_ProgressSet($uefiprogress, 75)
						EndIf
						If $BITLOCKYES = 1 Then
							FileInstall("BITLOCKER.7z", @HomeDrive & "\BITLOCKER.7z", 1)
							_ProgressSet($uefiprogress, 80)
							ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' add --extended EXTS/BITLOCKER.7z ' & @HomeDrive & '/BITLOCKER.7z', @HomeDrive, '', @SW_HIDE)
							_ProgressSet($uefiprogress, 85)
						EndIf
						If GUICtrlRead($NoMEM) = $GUI_CHECKED Then
							GUICtrlSetData($LabelTX, "��ǰ״̬�����ڵ���PE�ļ��ط�ʽ���м��ټ��أ����Ժ�......")
							_ProgressSet($uefiprogress, 90)
							FileInstall("menu.lst", @HomeDrive & "\menu.lst", 1)
							ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' add --extended menu.lst ' & @HomeDrive & '/menu.lst', @HomeDrive, '', @SW_HIDE)
							Sleep(1000)
							FileDelete(@HomeDrive & "\menu.lst")
							FileDelete(@HomeDrive & "\menu.lst")
						EndIf
						$NewUDsizes = ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' filelist', @HomeDrive, '', @SW_HIDE)
						$NewUDsize = Round($NewUDsizes / 1024)
						If $NewUDsize < 10 Then
							MsgBox(16 + 0, "��Ǹ", "����ʧ��! ���˳��������²���U������!", 35)
						Else
							MsgBox(64 + 0, "��ϲ", "�����ɹ��������ѡ��ȫ�Ƴ�U�̻��߽���UEFI����������", 35)
						EndIf
						GUICtrlSetData($LabelTX, "�����ɹ�������԰�ȫ�Ƴ�U���˳���������UEFI��������")
						Sleep(1000)
						_ProgressSet($uefiprogress, 100)
						GUICtrlSetState($USBmake, $GUI_SHOW)
						GUICtrlSetState($USBReset, $GUI_SHOW)
						GUICtrlSetState($USBUpdate, $GUI_SHOW)
						GUICtrlSetState($Exit, $GUI_SHOW)
						GUICtrlSetState($picsys1, $GUI_ENABLE)
						GUICtrlSetState($picsys2, $GUI_ENABLE)
						GUICtrlSetState($picsys3, $GUI_ENABLE)
						GUICtrlSetState($picsys4, $GUI_ENABLE)
						GUICtrlSetState($picsys5, $GUI_ENABLE)
						GUICtrlSetState($Combousb, $GUI_ENABLE)
						GUICtrlSetState($NoMEM, $GUI_ENABLE)
						GUICtrlSetState($InstallHDD, $GUI_ENABLE)
						GUICtrlSetState($BITLOCK, $GUI_ENABLE)
						GUICtrlSetState($ATHCN, $GUI_ENABLE)
						GUICtrlSetState($FBAmake, $GUI_ENABLE)
						_ProgressDelete($uefiprogress)
						GUICtrlSetData($LabelUQ8, "UD:420M|����:" & $NewUDsize & "M");������UD����Сд��label�ؼ�
						usbsize()
					Else
					EndIf
				EndIf
				If StringInStr($Driveifstars, "*", 0) <> 0 And $USBUDSIZE2 < 380 Then
					$askusb3 = MsgBox(32 + 1 + 256, "����", "��⵽���U���к���UD�������ط�������������С���ʺ�������װ" & @CR & "��ȷ��Ҫ����������ʼ������ɿ�U��װ�������𣿵�ȷ��������ȡ������")
					If $askusb3 = 1 Then
						GUICtrlSetState($USBmake, $GUI_HIDE)
						GUICtrlSetState($USBReset, $GUI_HIDE)
						GUICtrlSetState($USBUpdate, $GUI_HIDE)
						GUICtrlSetState($Exit, $GUI_HIDE)
						GUICtrlSetState($picsys1, $GUI_DISABLE)
						GUICtrlSetState($picsys2, $GUI_DISABLE)
						GUICtrlSetState($picsys3, $GUI_DISABLE)
						GUICtrlSetState($picsys4, $GUI_DISABLE)
						GUICtrlSetState($picsys5, $GUI_DISABLE)
						GUICtrlSetState($Combousb, $GUI_DISABLE)
						GUICtrlSetState($NoMEM, $GUI_DISABLE)
						GUICtrlSetState($InstallHDD, $GUI_DISABLE)
						GUICtrlSetState($BITLOCK, $GUI_DISABLE)
						GUICtrlSetState($ATHCN, $GUI_DISABLE)
						GUICtrlSetState($FBAmake, $GUI_DISABLE)
						FileInstall("gif\red.jpg", $tmpDirs & "\red.jpg", 1)
						FileInstall("gif\bg.jpg", $tmpDirs & "\bg.jpg", 1)
						
						$uefiprogress = _ProgressCreate(275, 422, 410, 22)
						_ProgressSetText($uefiprogress, "%P%%")
						_ProgressSetImages($uefiprogress, $tmpDirs & "\red.jpg", $tmpDirs & "\bg.jpg")
						_ProgressSetFont($uefiprogress, "", -1, -1, 0x339966)
						_ProgressSet($uefiprogress, 10)
						GUICtrlSetData($LabelTX, "��ǰ״̬������׼���ر������ļ������������У����Ժ�......")
						FileInstall("fbinst.exe", @HomeDrive & "\fbinst.exe", 1)
						_ProgressSet($uefiprogress, 25)
						FileInstall("Rpkusbfbasource.fba", @HomeDrive & "\Rpkusbfbasource.fba", 1)
						_ProgressSet($uefiprogress, 45)
						GUICtrlSetData($LabelTX, "��ǰ״̬�����ڸ�ʽ��Ŀ��U�̲�д�����������У����Ժ�......")
						ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' format --raw --force', @HomeDrive, '', @SW_HIDE)
						_ProgressSet($uefiprogress, 65)
						GUICtrlSetData($LabelTX, "��ǰ״̬�����ڽ�Ŀ��U�̷�����д����Ҫ�����У����Ժ�......")
						ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' format --extended 420m --force --align --fat32 --primary 8m --archive ' & @HomeDrive & '/Rpkusbfbasource.fba', @HomeDrive, '', @SW_HIDE)
						GUICtrlSetData($LabelTX, "��ǰ״̬�����ڽ�ѡ��ĸ��ӹ���д��Ŀ��U���У����Ժ�......")
						_ProgressSet($uefiprogress, 65)
						If $ATIHCNYES = 1 Then
							FileInstall("ATI5539CN.7z", @HomeDrive & "\ATI5539CN.7z", 1)
							_ProgressSet($uefiprogress, 70)
							ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' add --extended EXTS/ATI5539CN.7z ' & @HomeDrive & '/ATI5539CN.7z', @HomeDrive, '', @SW_HIDE)
							_ProgressSet($uefiprogress, 75)
						EndIf
						If $BITLOCKYES = 1 Then
							FileInstall("BITLOCKER.7z", @HomeDrive & "\BITLOCKER.7z", 1)
							_ProgressSet($uefiprogress, 80)
							ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' add --extended EXTS/BITLOCKER.7z ' & @HomeDrive & '/BITLOCKER.7z', @HomeDrive, '', @SW_HIDE)
							_ProgressSet($uefiprogress, 85)
						EndIf
						If GUICtrlRead($NoMEM) = $GUI_CHECKED Then
							GUICtrlSetData($LabelTX, "��ǰ״̬�����ڵ���PE�ļ��ط�ʽ���м��ټ��أ����Ժ�......")
							_ProgressSet($uefiprogress, 90)
							FileInstall("menu.lst", @HomeDrive & "\menu.lst", 1)
							ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' add --extended menu.lst ' & @HomeDrive & '/menu.lst', @HomeDrive, '', @SW_HIDE)
							Sleep(1000)
							FileDelete(@HomeDrive & "\menu.lst")
						EndIf
						$NewUDsizes = ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' filelist', @HomeDrive, '', @SW_HIDE)
						$NewUDsize = Round($NewUDsizes / 1024)
						If $NewUDsize < 10 Then
							MsgBox(16 + 0, "��Ǹ", "����ʧ��! ���˳��������²���U������!", 35)
						Else
							MsgBox(64 + 0, "��ϲ", "�����ɹ��������ѡ��ȫ�Ƴ�U�̻��߽���UEFI����������", 35)
						EndIf
						GUICtrlSetData($LabelTX, "�����ɹ�������԰�ȫ�Ƴ�U���˳���������UEFI��������")
						Sleep(1000)
						_ProgressSet($uefiprogress, 100)
						GUICtrlSetState($USBmake, $GUI_SHOW)
						GUICtrlSetState($USBReset, $GUI_SHOW)
						GUICtrlSetState($USBUpdate, $GUI_SHOW)
						GUICtrlSetState($Exit, $GUI_SHOW)
						GUICtrlSetState($picsys1, $GUI_ENABLE)
						GUICtrlSetState($picsys2, $GUI_ENABLE)
						GUICtrlSetState($picsys3, $GUI_ENABLE)
						GUICtrlSetState($picsys4, $GUI_ENABLE)
						GUICtrlSetState($picsys5, $GUI_ENABLE)
						GUICtrlSetState($Combousb, $GUI_ENABLE)
						GUICtrlSetState($NoMEM, $GUI_ENABLE)
						GUICtrlSetState($InstallHDD, $GUI_ENABLE)
						GUICtrlSetState($BITLOCK, $GUI_ENABLE)
						GUICtrlSetState($ATHCN, $GUI_ENABLE)
						GUICtrlSetState($FBAmake, $GUI_ENABLE)
						_ProgressDelete($uefiprogress)
						GUICtrlSetData($LabelUQ8, "UD:420M|����:" & $NewUDsize & "M");������UD����Сд��label�ؼ�
						usbsize()
					Else
					EndIf
				EndIf
				If StringInStr($Driveifstars, "*", 0) = 0 Then
					$askusb2 = MsgBox(32 + 1 + 256, "����", "һ����ʼ������U�����ݽ�ȫ����ʧ�����������ȱ���U������Ҫ���ݣ�" & @CR & "��ȷ��Ҫ����������ʼ������ɿ�U��װ�������𣿵�ȷ��������ȡ������")
					If $askusb2 = 1 Then
						GUICtrlSetState($USBmake, $GUI_HIDE)
						GUICtrlSetState($USBReset, $GUI_HIDE)
						GUICtrlSetState($USBUpdate, $GUI_HIDE)
						GUICtrlSetState($Exit, $GUI_HIDE)
						GUICtrlSetState($picsys1, $GUI_DISABLE)
						GUICtrlSetState($picsys2, $GUI_DISABLE)
						GUICtrlSetState($picsys3, $GUI_DISABLE)
						GUICtrlSetState($picsys4, $GUI_DISABLE)
						GUICtrlSetState($picsys5, $GUI_DISABLE)
						GUICtrlSetState($Combousb, $GUI_DISABLE)
						GUICtrlSetState($NoMEM, $GUI_DISABLE)
						GUICtrlSetState($InstallHDD, $GUI_DISABLE)
						GUICtrlSetState($BITLOCK, $GUI_DISABLE)
						GUICtrlSetState($ATHCN, $GUI_DISABLE)
						GUICtrlSetState($FBAmake, $GUI_DISABLE)
						
						FileInstall("gif\red.jpg", $tmpDirs & "\red.jpg", 1)
						FileInstall("gif\bg.jpg", $tmpDirs & "\bg.jpg", 1)
						
						$uefiprogress = _ProgressCreate(275, 422, 410, 22)
						_ProgressSetText($uefiprogress, "%P%%")
						_ProgressSetImages($uefiprogress, $tmpDirs & "\red.jpg", $tmpDirs & "\bg.jpg")
						_ProgressSetFont($uefiprogress, "", -1, -1, 0x339966)
						_ProgressSet($uefiprogress, 10)
						
						GUICtrlSetData($LabelTX, "��ǰ״̬������׼���ر������ļ������������У����Ժ�......")
						FileInstall("fbinst.exe", @HomeDrive & "\fbinst.exe", 1)
						_ProgressSet($uefiprogress, 25)
						FileInstall("Rpkusbfbasource.fba", @HomeDrive & "\Rpkusbfbasource.fba", 1)
						_ProgressSet($uefiprogress, 45)
						GUICtrlSetData($LabelTX, "��ǰ״̬�����ڸ�ʽ��Ŀ��U�̲�д�����������У����Ժ�......")
						ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' format --raw --force', @HomeDrive, '', @SW_HIDE)
						_ProgressSet($uefiprogress, 65)
						GUICtrlSetData($LabelTX, "��ǰ״̬�����ڽ�Ŀ��U�̷�����д����Ҫ�����У����Ժ�......")
						ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' format --extended 420m --force --align --fat32 --primary 8m --archive ' & @HomeDrive & '/Rpkusbfbasource.fba', @HomeDrive, '', @SW_HIDE)
						GUICtrlSetData($LabelTX, "��ǰ״̬�����ڽ�ѡ��ĸ��ӹ���д��Ŀ��U���У����Ժ�......")
						_ProgressSet($uefiprogress, 65)
						If $ATIHCNYES = 1 Then
							FileInstall("ATI5539CN.7z", @HomeDrive & "\ATI5539CN.7z", 1)
							_ProgressSet($uefiprogress, 70)
							ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' add --extended EXTS/ATI5539CN.7z ' & @HomeDrive & '/ATI5539CN.7z', @HomeDrive, '', @SW_HIDE)
							_ProgressSet($uefiprogress, 75)
						EndIf
						If $BITLOCKYES = 1 Then
							FileInstall("BITLOCKER.7z", @HomeDrive & "\BITLOCKER.7z", 1)
							_ProgressSet($uefiprogress, 80)
							ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' add --extended EXTS/BITLOCKER.7z ' & @HomeDrive & '/BITLOCKER.7z', @HomeDrive, '', @SW_HIDE)
							_ProgressSet($uefiprogress, 85)
						EndIf
						If GUICtrlRead($NoMEM) = $GUI_CHECKED Then
							GUICtrlSetData($LabelTX, "��ǰ״̬�����ڵ���PE�ļ��ط�ʽ���м��ټ��أ����Ժ�......")
							_ProgressSet($uefiprogress, 90)
							FileInstall("menu.lst", @HomeDrive & "\menu.lst", 1)
							ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' add --extended menu.lst ' & @HomeDrive & '/menu.lst', @HomeDrive, '', @SW_HIDE)
							Sleep(1000)
							FileDelete(@HomeDrive & "\menu.lst")
						EndIf
						$NewUDsizes = ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' filelist', @HomeDrive, '', @SW_HIDE)
						$NewUDsize = Round($NewUDsizes / 1024)
						FileDelete(@HomeDrive & "\fbinst.exe")
						FileDelete(@HomeDrive & "\Rpkusbfbasource.fba")
						If $NewUDsize < 10 Then
							MsgBox(16 + 0, "��Ǹ", "����ʧ��! ���˳��������²���U������!", 35)
							GUICtrlSetData($LabelTX, "��ǰ״̬������ʧ�ܣ�û��д�������ļ������ݣ�����U��")
							_ProgressSet($uefiprogress, 100)
						Else
							MsgBox(64 + 0, "��ϲ", "�����ɹ��������ѡ��ȫ�Ƴ�U�̻��߽���UEFI����������", 35)
							GUICtrlSetData($LabelTX, "�����ɹ�������԰�ȫ�Ƴ�U���˳���������UEFI��������")
							_ProgressSet($uefiprogress, 100)
						EndIf
						GUICtrlSetState($USBmake, $GUI_SHOW)
						GUICtrlSetState($USBReset, $GUI_SHOW)
						GUICtrlSetState($USBUpdate, $GUI_SHOW)
						GUICtrlSetState($Exit, $GUI_SHOW)
						GUICtrlSetState($picsys1, $GUI_ENABLE)
						GUICtrlSetState($picsys2, $GUI_ENABLE)
						GUICtrlSetState($picsys3, $GUI_ENABLE)
						GUICtrlSetState($picsys4, $GUI_ENABLE)
						GUICtrlSetState($picsys5, $GUI_ENABLE)
						GUICtrlSetState($Combousb, $GUI_ENABLE)
						GUICtrlSetState($NoMEM, $GUI_ENABLE)
						GUICtrlSetState($InstallHDD, $GUI_ENABLE)
						GUICtrlSetState($BITLOCK, $GUI_ENABLE)
						GUICtrlSetState($ATHCN, $GUI_ENABLE)
						GUICtrlSetState($FBAmake, $GUI_ENABLE)
						_ProgressDelete($uefiprogress)
						GUICtrlSetData($LabelUQ8, "UD:420M|����:" & $NewUDsize & "M");������UD����Сд��label�ؼ�
						usbsize()
					EndIf
				EndIf
			EndIf
		Case $USBReset
			$Driveifstars = GUICtrlRead($Combousb)
			$DriveTsizess = StringRegExp(GUICtrlRead($Combousb), '(?<=\()[^)]+', 1);ʹ��������ʽ����Combousb�ؼ��е��ַ������õ�������hdx�������ַ���
			$DriveTsizes = StringRight($DriveTsizess[0], 1);��ȡ���������ַ���������ұ߿�ʼ��һ����һ�����Win�µ�Ӳ�̱��;Ҳ����fbinst��Ӳ�̱��
			$fbinstHDx = "(hd" & $DriveTsizes & ")"
			FileInstall("fbinst.exe", @HomeDrive & "\fbinst.exe", 1)
			$askusb5 = MsgBox(32 + 1 + 256, "����", "һ����ԭ������U�̿ɼ���������UD�������ݽ�ȫ����ʧ�������㱸����Ҫ���ݺ��ټ�����" & @CR & "��ȷ��Ҫ����������ʼ��ԭU�̵���ʼ״̬�𣿵�ȷ��������ȡ������")
			If $askusb5 = 1 Then
				GUICtrlSetState($USBmake, $GUI_HIDE)
				GUICtrlSetState($USBReset, $GUI_HIDE)
				GUICtrlSetState($USBUpdate, $GUI_HIDE)
				GUICtrlSetState($Exit, $GUI_HIDE)
				GUICtrlSetState($picsys1, $GUI_DISABLE)
				GUICtrlSetState($picsys2, $GUI_DISABLE)
				GUICtrlSetState($picsys3, $GUI_DISABLE)
				GUICtrlSetState($picsys4, $GUI_DISABLE)
				GUICtrlSetState($picsys5, $GUI_DISABLE)
				GUICtrlSetState($Combousb, $GUI_DISABLE)
				GUICtrlSetState($NoMEM, $GUI_DISABLE)
				GUICtrlSetState($InstallHDD, $GUI_DISABLE)
				GUICtrlSetState($BITLOCK, $GUI_DISABLE)
				GUICtrlSetState($ATHCN, $GUI_DISABLE)
				GUICtrlSetState($FBAmake, $GUI_DISABLE)
				
				FileInstall("gif\red.jpg", $tmpDirs & "\red.jpg", 1)
				FileInstall("gif\bg.jpg", $tmpDirs & "\bg.jpg", 1)
				
				$uefiprogress = _ProgressCreate(275, 422, 410, 22)
				_ProgressSetText($uefiprogress, "%P%%")
				_ProgressSetImages($uefiprogress, $tmpDirs & "\red.jpg", $tmpDirs & "\bg.jpg")
				_ProgressSetFont($uefiprogress, "", -1, -1, 0x339966)
				_ProgressSet($uefiprogress, 10)
				Sleep(2000)
				_ProgressSet($uefiprogress, 45)
				GUICtrlSetData($LabelTX, "��ǰ״̬�����ڻ�ԭĿ��U�̵���ʼ״̬�У����Ժ�......")
				ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' format --raw --force', @HomeDrive, '', @SW_HIDE)
				_ProgressSet($uefiprogress, 85)
				FileDelete(@HomeDrive & "\fbinst.exe")
				Sleep(2000)
				$panfusnew = StringStripWS(GUICtrlRead($Combousb), 8);ǿ��ɾ����ȡ�����ַ����е����пո�
				$panfunew = StringRight($panfusnew, 2);��ȡɾ���ո����ַ������ұ߿�ʼ��2���ַ�
				$usbsizenew = Floor(DriveSpaceTotal($panfunew));ʹ��AU3��ȡWin�¿ɼ��ռ��С
				MsgBox(64 + 0, "��ʾ", "��ʼ��U�̺�U�̵�����Ϊ:" & $usbsizenew & "MB", 35)
				GUICtrlSetState($USBmake, $GUI_SHOW)
				GUICtrlSetState($USBReset, $GUI_SHOW)
				GUICtrlSetState($USBUpdate, $GUI_SHOW)
				GUICtrlSetState($Exit, $GUI_SHOW)
				GUICtrlSetState($picsys1, $GUI_ENABLE)
				GUICtrlSetState($picsys2, $GUI_ENABLE)
				GUICtrlSetState($picsys3, $GUI_ENABLE)
				GUICtrlSetState($picsys4, $GUI_ENABLE)
				GUICtrlSetState($picsys5, $GUI_ENABLE)
				GUICtrlSetState($Combousb, $GUI_ENABLE)
				GUICtrlSetState($NoMEM, $GUI_ENABLE)
				GUICtrlSetState($InstallHDD, $GUI_ENABLE)
				GUICtrlSetState($BITLOCK, $GUI_ENABLE)
				GUICtrlSetState($ATHCN, $GUI_ENABLE)
				GUICtrlSetState($FBAmake, $GUI_ENABLE)
				GUICtrlSetData($LabelTX, "�Ѿ��ɹ���ԭU�̵���ʼ��״̬�����˳�������߽�����������")
				usbsize()
			Else
			EndIf
		Case $Exituefi
			ExitProgram()
	EndSwitch
WEnd
Func ExitProgram()
	DirRemove($tmpDirs, 1)
	FileDelete("C:\fbinst.exe")
	FileDelete("C:\Rpkusbfbasource.fba")
	FileDelete(@HomeDrive & "\Rpkusbfbasource.fba")
	FileDelete(@HomeDrive & "\fbinst.exe")
	FileDelete(@HomeDrive & "\udinfos.txt")
	FileDelete(@HomeDrive & "\ATI5539CN.7z")
	FileDelete(@HomeDrive & "\BITLOCKER.7z")
	RegDelete("HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers", @HomeDrive & "\fbinst.exe")
	GUIDelete($GUI)
	_WaterCtrl_Shutdown()
	Exit
EndFunc   ;==>ExitProgram
Func InstallHDD()
	GUICtrlSetState($USBmake, $GUI_DISABLE)
	GUICtrlSetState($USBReset, $GUI_DISABLE)
	GUICtrlSetState($USBUpdate, $GUI_DISABLE)
	GUICtrlSetState($Exit, $GUI_DISABLE)
	GUICtrlSetState($picsys1, $GUI_DISABLE)
	GUICtrlSetState($picsys2, $GUI_DISABLE)
	GUICtrlSetState($picsys3, $GUI_DISABLE)
	GUICtrlSetState($picsys4, $GUI_DISABLE)
	GUICtrlSetState($picsys5, $GUI_DISABLE)
	GUICtrlSetState($Combousb, $GUI_DISABLE)
	GUICtrlSetState($NoMEM, $GUI_DISABLE)
	GUICtrlSetState($InstallHDD, $GUI_DISABLE)
	GUICtrlSetState($BITLOCK, $GUI_DISABLE)
	GUICtrlSetState($ATHCN, $GUI_DISABLE)
	GUICtrlSetState($FBAmake, $GUI_DISABLE)
	GUICtrlSetData($LabelTX, "  ��ǰ״̬����������׼������ϵͳ�������У����Ժ�......")
	Sleep(1000)
	;$ver = DriveGetDrive("FIXED")
	;$i = $ver[0]
	;$var = StringUpper($ver[$i])
	;$DriveFreeSize = DriveSpaceFree($var & "\")
	;If $var <> @HomeDrive And $DriveFreeSize > "500" Then;������ϵͳ�̣�ʣ����������500MB
	$PEDrive = @HomeDrive
	Local $FBAFILE = @HomeDrive & '/Rpkusbfbasource.fba'
	If $OS <= "5.2" Then;�����NT5.2ϵͳ�����дboot.ini�������ļ����ܰ�װ
		GUICtrlSetData($LabelTX, "  ��ǰ״̬�����ڴ�����ϵͳ�������ļ��У����Ժ�......")
		;_ProgressSet($uefiprogress, 40)
		Sleep(1000)
		If FileExists(@HomeDrive & "\boot.ini.rpk") Then FileDelete(@HomeDrive & "\boot.ini.rpk")
		FileSetAttrib(@HomeDrive & "\boot.ini", "-HSR")
		FileCopy(@HomeDrive & "\boot.ini", @HomeDrive & "\boot.ini.rpk", 1)
		FileSetAttrib(@HomeDrive & "\boot.ini.rpk", "+HR")
		IniWrite(@HomeDrive & "\boot.ini", "operating systems", $PEDrive & "\rpkdr.mbr", "��ɿ�ά��ϵͳ")
		;����fbinst.exe��fbaԴ�ļ���ȡ��������ϵͳPE�������ļ�����⵽�ĺ��ʵķ�����
		DirRemove($PEDrive & "\RPK", 1)
		DirCreate($PEDrive & "\RPK")
		;_ProgressSet($uefiprogress, 50)
		GUICtrlSetData($LabelTX, "  ��ǰ״̬�����ڽ�PE�����ļ����Ƶ��ض�λ���У����Ժ�......")
		FileInstall("Rpkusbfbasource.fba", @HomeDrive & "\Rpkusbfbasource.fba", 1)
		FileInstall("fbinst.exe", @HomeDrive & "\fbinst.exe", 1)
		RunWait(@HomeDrive & '\fbinst.exe ' & $FBAFILE & ' output "boot/*.i*" ' & $PEDrive & '/RPK/', @HomeDrive, @SW_HIDE)
		RunWait(@HomeDrive & '\fbinst.exe ' & $FBAFILE & ' output "tools/*.im?*" ' & $PEDrive & '/RPK/', @HomeDrive, @SW_HIDE)
		RunWait(@HomeDrive & '\fbinst.exe ' & $FBAFILE & ' output "message" ' & $PEDrive & '/RPK/', @HomeDrive, @SW_HIDE)
		FileInstall("toolhdd.lst", $PEDrive & "\RPK\TOOLS.LST", 1)
		If FileExists($PEDrive & "\rpkdr.mbr") Then FileSetAttrib($PEDrive & "\rpkdr.mbr", "-HSR")
		FileDelete($PEDrive & "\rpkdr.mbr")
		FileInstall("rpkdr.mbr", $PEDrive & "\rpkdr.mbr", 1)
		If FileExists($PEDrive & "\rpkdr") Then FileSetAttrib($PEDrive & "\rpkdr", "-HSR")
		FileDelete($PEDrive & "\rpkdr")
		FileInstall("rpkdr", $PEDrive & "\rpkdr", 1)
		FileSetAttrib($PEDrive & "\rpkdr", "+HSR")
		FileSetAttrib($PEDrive & "\rpkdr.mbr", "+HSR")
		FileSetAttrib(@HomeDrive & "\boot.ini", "+HSR")
		FileSetAttrib($PEDrive & "\RPK", "+H", 1)
		GUICtrlSetData($LabelTX, "  ��ǰ״̬�����ڼ�鱾��ϵͳ��PE�ļ��Ƿ����������Ժ�......")
		Sleep(1000)
		$PEDIRSIZE = Round(DirGetSize($PEDrive & "\RPK") / 1024 / 1024)
		If $PEDIRSIZE < 340 Then
			MsgBox(64 + 0, "����", "��װ������ϵͳ��PE�ļ���������" & @CRLF & "�������˳��������°�װ������ϵͳ��", 35)
		Else
			MsgBox(64 + 0, "����", "��PEά��ϵͳ��װ������ϵͳ�������˵���ɣ�������˳�����������ɿ�����ķ���", 35)
		EndIf
		;_ProgressSet($uefiprogress, 90)
	EndIf
	If $OS > "5.2" Then;�����Vista������ϵͳ�������BcdEdit�������������
		Sleep(1000)
		If Not FileExists(@WindowsDir & "\Bcdedit.exe") Then FileInstall("Bcdedit.exe", @WindowsDir & "\Bcdedit.exe")
		Local $BCDEDIT = @WindowsDir & "\Bcdedit.exe"
		Local $VID = "{F8271F63-1D7F-46BA-A36D-1D192901D0DC}"
		GUICtrlSetData($LabelTX, "  ��ǰ״̬���������PE�����˵�������ϵͳ�У����Ժ�......")
		RunWait(@ComSpec & " /c " & $BCDEDIT & " /delete " & $VID, "", 0)
		ShellExecuteWait($BCDEDIT, "/create " & $VID & " /d  ��ɿ�ά��ϵͳ /application bootsector", @SystemDir, "", 0)
		RunWait(@ComSpec & " /c " & $BCDEDIT & " /set " & $VID & " device boot", "", 0)
		RunWait(@ComSpec & " /c " & $BCDEDIT & " /set " & $VID & " path \rpkdr.mbr", "", 0)
		RunWait(@ComSpec & " /c " & $BCDEDIT & " /displayorder " & $VID & " /addlast", "", 0)
		RunWait(@ComSpec & " /c " & $BCDEDIT & " /timeout 5", "", 0)
		DirRemove($PEDrive & "\RPK", 1)
		DirCreate($PEDrive & "\RPK")
		FileInstall("Rpkusbfbasource.fba", @HomeDrive & "\Rpkusbfbasource.fba", 1)
		FileInstall("fbinst.exe", @HomeDrive & "\fbinst.exe", 1)
		GUICtrlSetData($LabelTX, "  ��ǰ״̬�����ڽ�PE�����ļ����Ƶ��ض�λ���У����Ժ�......")
		RunWait(@HomeDrive & '\fbinst.exe ' & $FBAFILE & ' output "boot/*.i*" ' & $PEDrive & '/RPK/', @HomeDrive, @SW_HIDE)
		RunWait(@HomeDrive & '\fbinst.exe ' & $FBAFILE & ' output "tools/*.im?*" ' & $PEDrive & '/RPK/', @HomeDrive, @SW_HIDE)
		RunWait(@HomeDrive & '\fbinst.exe ' & $FBAFILE & ' output "message" ' & $PEDrive & '/RPK/', @HomeDrive, @SW_HIDE)
		FileInstall("toolhdd.lst", $PEDrive & "\RPK\TOOLS.LST", 1)
		If FileExists($PEDrive & "\rpkdr.mbr") Then FileSetAttrib($PEDrive & "\rpkdr.mbr", "-HSR")
		FileDelete($PEDrive & "\rpkdr.mbr")
		FileInstall("rpkdr.mbr", $PEDrive & "\rpkdr.mbr", 1)
		If FileExists($PEDrive & "\rpkdr") Then FileSetAttrib($PEDrive & "\rpkdr", "-HSR")
		FileDelete($PEDrive & "\rpkdr")
		FileInstall("rpkdr", $PEDrive & "\rpkdr", 1)
		FileSetAttrib($PEDrive & "\rpkdr", "+HSR")
		FileSetAttrib($PEDrive & "\rpkdr.mbr", "+HSR")
		FileSetAttrib($PEDrive & "\RPK", "+H", 1)
		GUICtrlSetData($LabelTX, "  ��ǰ״̬�����ڼ�鱾��ϵͳ��PE�ļ��Ƿ����������Ժ�......")
		Sleep(1000)
		FileDelete(@HomeDrive & "\fbinst.exe")
		FileDelete(@HomeDrive & "\Rpkusbfbasource.fba")
		FileDelete($BCDEDIT)
		$PEDIRSIZE = Round(DirGetSize($PEDrive & "\RPK") / 1024 / 1024)
		If $PEDIRSIZE < 340 Then
			MsgBox(64 + 0, "����", "��װ������ϵͳ��PE�ļ���������" & @CRLF & "�������˳��������°�װ������ϵͳ��", 35)
		Else
			MsgBox(64 + 0, "����", "��PEά��ϵͳ��װ������ϵͳ�������˵���ɣ�������˳�����������ɿ�����ķ���", 35)
		EndIf
		
	EndIf
	;ȡ����һ�����˳�ѭ��������
	GUICtrlSetData($LabelTX, "�����ɹ�������Թرճ��������ɿ˼�����̳���н���ѧϰ��")
	GUICtrlSetState($USBmake, $GUI_ENABLE)
	GUICtrlSetState($USBReset, $GUI_ENABLE)
	GUICtrlSetState($USBUpdate, $GUI_ENABLE)
	GUICtrlSetState($Exit, $GUI_ENABLE)
	GUICtrlSetState($picsys1, $GUI_ENABLE)
	GUICtrlSetState($picsys2, $GUI_ENABLE)
	GUICtrlSetState($picsys3, $GUI_ENABLE)
	GUICtrlSetState($picsys4, $GUI_ENABLE)
	GUICtrlSetState($picsys5, $GUI_ENABLE)
	GUICtrlSetState($Combousb, $GUI_ENABLE)
	GUICtrlSetState($NoMEM, $GUI_ENABLE)
	GUICtrlSetState($InstallHDD, $GUI_ENABLE)
	GUICtrlSetState($BITLOCK, $GUI_ENABLE)
	GUICtrlSetState($ATHCN, $GUI_ENABLE)
	GUICtrlSetState($FBAmake, $GUI_ENABLE)
EndFunc   ;==>InstallHDD
Func usbsize()
	$Driveifstars = GUICtrlRead($Combousb)
	$DriveTsizess = StringRegExp(GUICtrlRead($Combousb), '(?<=\()[^)]+', 1);ʹ��������ʽ����Combousb�ؼ��е��ַ������õ�������hdx�������ַ���
	$panfus = StringStripWS(GUICtrlRead($Combousb), 8);ǿ��ɾ����ȡ�����ַ����е����пո�
	$panfu = StringRight($panfus, 2);��ȡɾ���ո����ַ������ұ߿�ʼ��2���ַ�
	$usbsize = Floor(DriveSpaceTotal($panfu));ʹ��AU3��ȡWin�¿ɼ��ռ��С
	If $Driveifstars <> "" Then
		$DriveTsizes = StringRight($DriveTsizess[0], 1);��ȡ���������ַ���������ұ߿�ʼ��һ����һ�����Win�µ�Ӳ�̱��
		FileInstall("fbinst.exe", @HomeDrive & "\fbinst.exe", 1)
		If FileExists(@HomeDrive & '\udinfos.txt') Then FileDelete(@HomeDrive & '\udinfos.txt')
		If FileExists(@ScriptDir & '\udinfos.txt') Then FileDelete(@ScriptDir & '\udinfos.txt')
		RunWait(@ComSpec & ' /c ' & @HomeDrive & '\fbinst (hd' & $DriveTsizes & ') info > ' & @HomeDrive & '\udinfos.txt', @HomeDrive, @SW_HIDE)
		If FileGetSize(@HomeDrive & '\udinfos.txt') > 10 Then
			Local $fileopen = FileOpen(@HomeDrive & '\udinfos.txt')
			Local $fileread = FileReadLine($fileopen, 5)
			Local $filestrings2 = StringSplit(StringStripWS($fileread, 8), ":")
			Local $USBUDSIZE2 = $filestrings2[2] / 2048
			Local $DriveTsize = $USBUDSIZE2 + 8 + $usbsize
			FileClose($fileopen)
		EndIf
		If FileGetSize(@HomeDrive & '\udinfos.txt') < 10 Then
			Local $USBUDSIZE2 = "0"
			Local $DriveTsize = $usbsize
		EndIf
		;����ֻ��ʹ��bootice����֤����Ҫ���ȸ���bootice.exe��C�̸�Ŀ¼��
		;RunWait('cmd.exe  /c  C:\bootice.exe  /DEVICE=' & $panfu & ' /diskinfo /file=C:\diskinfo.ini', "C:\", @SW_HIDE)
		GUICtrlSetData($LabelUQ6, "��������" & $DriveTsize & "MB �ɼ�����" & $usbsize & "MB")
		$fbinstHDx = "(hd" & $DriveTsizes & ")"
		FileInstall("fbinst.exe", @HomeDrive & "\fbinst.exe", 1)
		$foo = ShellExecuteWait(@HomeDrive & '\fbinst.exe', $fbinstHDx & ' filelist', @HomeDrive, '', @SW_HIDE)
		$UDtotal = Round($foo / 1024);�õ�UD�����ļ��ܴ�С
		If $USBUDSIZE2 < 20 Then;�ϴ�������U�����������ܱȽϴ󣬹���������һ�����������
			$UDSIZE = "��UD"
		EndIf
		If $USBUDSIZE2 >= 20 Then;
			$UDSIZE = $USBUDSIZE2 & "M"
			;MsgBox(64 + 0, "", $DriveTsizess[0] & "U���̷���FBINST��ʾ����Ϊ��" & $DriveTsizes)
		EndIf
		GUICtrlSetData($LabelUQ8, "UD��:" & $UDSIZE & "|����" & $UDtotal & "M");������UD����Сд��label�ؼ�
	EndIf
	If $Driveifstars = "" Then
		GUICtrlSetData($LabelUQ8, "UD��:��UD������");������UD����Сд��label�ؼ�
	EndIf
EndFunc   ;==>usbsize
Func _disk()
	Local $foo, $line, $lines
	FileDelete(@HomeDrive & "\fbinst.exe")
	FileInstall("fbinst.exe", @HomeDrive & "\fbinst.exe", 1)
	$foo = Run(@ComSpec & ' /c ' & @HomeDrive & '\fbinst --hdlist "(hd%N) %I %Sg %U %P" --USB', @HomeDrive, @SW_HIDE, $STDOUT_CHILD)
	$lines = ""
	While 1
		$line = StdoutRead($foo)
		If @error Then
			$UDUSBYN = "û��U�̺���UDϵͳ��"
			ExitLoop
		EndIf
		$lines &= $line
	WEnd
	Return $lines
EndFunc   ;==>_disk
;�滻fbinst�����̷���ֵ�ַ����еĿ��ַ�
Func replace0()
	$outdisk = StringReplace($disk, @CR, "", -1)
	Return $outdisk
EndFunc   ;==>replace0
Func systemhide()
	GUICtrlSetState($group1, $GUI_HIDE)
	GUICtrlSetState($group2, $GUI_HIDE)
	GUICtrlSetState($group3, $GUI_HIDE)
	GUICtrlSetState($SICOMS, $GUI_HIDE)
	GUICtrlSetState($SICOUP, $GUI_HIDE)
	GUICtrlSetState($Label1, $GUI_HIDE)
	GUICtrlSetState($Label2, $GUI_HIDE)
	GUICtrlSetState($Label3, $GUI_HIDE)
	GUICtrlSetState($Label4, $GUI_HIDE)
	GUICtrlSetState($Label5, $GUI_HIDE)
	GUICtrlSetState($Label6, $GUI_HIDE)
	GUICtrlSetState($Label7, $GUI_HIDE)
	GUICtrlSetState($Label8, $GUI_HIDE)
	GUICtrlSetState($Label9, $GUI_HIDE)
	GUICtrlSetState($Label10, $GUI_HIDE)
	GUICtrlSetState($Label11, $GUI_HIDE)
	GUICtrlSetState($Label12, $GUI_HIDE)
	GUICtrlSetState($Combo1, $GUI_HIDE)
EndFunc   ;==>systemhide
Func systemshow()
	GUICtrlSetState($group1, $GUI_SHOW)
	GUICtrlSetState($group2, $GUI_SHOW)
	GUICtrlSetState($group3, $GUI_SHOW)
	GUICtrlSetState($SICOMS, $GUI_SHOW)
	GUICtrlSetState($SICOUP, $GUI_SHOW)
	GUICtrlSetState($Label1, $GUI_SHOW)
	GUICtrlSetState($Label2, $GUI_SHOW)
	GUICtrlSetState($Label3, $GUI_SHOW)
	GUICtrlSetState($Label4, $GUI_SHOW)
	GUICtrlSetState($Label5, $GUI_SHOW)
	GUICtrlSetState($Label6, $GUI_SHOW)
	GUICtrlSetState($Label7, $GUI_SHOW)
	GUICtrlSetState($Label8, $GUI_SHOW)
	GUICtrlSetState($Label9, $GUI_SHOW)
	GUICtrlSetState($Label10, $GUI_SHOW)
	GUICtrlSetState($Label11, $GUI_SHOW)
	GUICtrlSetState($Label12, $GUI_SHOW)
	GUICtrlSetState($Combo1, $GUI_SHOW)
EndFunc   ;==>systemshow
Func PEinfohide()
	GUICtrlSetState($groupP1, $GUI_HIDE)
	GUICtrlSetState($groupP2, $GUI_HIDE)
	GUICtrlSetState($groupP3, $GUI_HIDE)
	GUICtrlSetState($LabelP1, $GUI_HIDE)
	GUICtrlSetState($LabelP2, $GUI_HIDE)
	GUICtrlSetState($LabelP3, $GUI_HIDE)
	GUICtrlSetState($LabelP4, $GUI_HIDE)
	GUICtrlSetState($LabelP5, $GUI_HIDE)
	GUICtrlSetState($LabelP6, $GUI_HIDE)
	GUICtrlSetState($LabelP7, $GUI_HIDE)
	GUICtrlSetState($LabelP8, $GUI_HIDE)
EndFunc   ;==>PEinfohide
Func PEinfoshow()
	GUICtrlSetState($groupP1, $GUI_SHOW)
	GUICtrlSetState($groupP2, $GUI_SHOW)
	GUICtrlSetState($groupP3, $GUI_SHOW)
	GUICtrlSetState($LabelP1, $GUI_SHOW)
	GUICtrlSetState($LabelP2, $GUI_SHOW)
	GUICtrlSetState($LabelP3, $GUI_SHOW)
	GUICtrlSetState($LabelP4, $GUI_SHOW)
	GUICtrlSetState($LabelP5, $GUI_SHOW)
	GUICtrlSetState($LabelP6, $GUI_SHOW)
	GUICtrlSetState($LabelP7, $GUI_SHOW)
	GUICtrlSetState($LabelP8, $GUI_SHOW)
EndFunc   ;==>PEinfoshow
Func USBhide()
	GUICtrlSetState($groupUQ1, $GUI_HIDE)
	GUICtrlSetState($groupUQ2, $GUI_HIDE)
	GUICtrlSetState($groupUQ3, $GUI_HIDE)
	GUICtrlSetState($LabelUQ1, $GUI_HIDE)
	GUICtrlSetState($LabelUQ2, $GUI_HIDE)
	GUICtrlSetState($LabelUQ3, $GUI_HIDE)
	GUICtrlSetState($LabelUQ4, $GUI_HIDE)
	GUICtrlSetState($LabelUQ5, $GUI_HIDE)
	GUICtrlSetState($LabelUQ6, $GUI_HIDE)
	GUICtrlSetState($LabelUQ7, $GUI_HIDE)
	GUICtrlSetState($LabelUQ8, $GUI_HIDE)
	GUICtrlSetState($UQFBAICO, $GUI_HIDE)
	GUICtrlSetState($UQPEICO, $GUI_HIDE)
	GUICtrlSetState($Combousb, $GUI_HIDE)
	GUICtrlSetState($USBmake, $GUI_HIDE)
	GUICtrlSetState($USBReset, $GUI_HIDE)
	GUICtrlSetState($USBUpdate, $GUI_HIDE)
	GUICtrlSetState($Exit, $GUI_HIDE)
	GUICtrlSetState($LabelTX, $GUI_HIDE)
	GUICtrlSetState($FBAmake, $GUI_HIDE)
	GUICtrlSetState($NoMEM, $GUI_HIDE)
	GUICtrlSetState($InstallHDD, $GUI_HIDE)
	GUICtrlSetState($BITLOCK, $GUI_HIDE)
	GUICtrlSetState($ATHCN, $GUI_HIDE)
EndFunc   ;==>USBhide
Func USBshow()
	GUICtrlSetState($groupUQ1, $GUI_SHOW)
	GUICtrlSetState($groupUQ2, $GUI_SHOW)
	GUICtrlSetState($groupUQ3, $GUI_SHOW)
	GUICtrlSetState($LabelUQ1, $GUI_SHOW)
	GUICtrlSetState($LabelUQ2, $GUI_SHOW)
	GUICtrlSetState($LabelUQ3, $GUI_SHOW)
	GUICtrlSetState($LabelUQ4, $GUI_SHOW)
	GUICtrlSetState($LabelUQ5, $GUI_SHOW)
	GUICtrlSetState($LabelUQ6, $GUI_SHOW)
	GUICtrlSetState($LabelUQ7, $GUI_SHOW)
	GUICtrlSetState($LabelUQ8, $GUI_SHOW)
	GUICtrlSetState($UQFBAICO, $GUI_SHOW)
	GUICtrlSetState($UQPEICO, $GUI_SHOW)
	GUICtrlSetState($Combousb, $GUI_SHOW)
	GUICtrlSetState($USBmake, $GUI_SHOW)
	GUICtrlSetState($USBReset, $GUI_SHOW)
	GUICtrlSetState($USBUpdate, $GUI_SHOW)
	GUICtrlSetState($Exit, $GUI_SHOW)
	GUICtrlSetState($LabelTX, $GUI_SHOW)
	GUICtrlSetState($FBAmake, $GUI_SHOW)
	GUICtrlSetState($NoMEM, $GUI_SHOW)
	GUICtrlSetState($InstallHDD, $GUI_SHOW)
	GUICtrlSetState($BITLOCK, $GUI_SHOW)
	GUICtrlSetState($ATHCN, $GUI_SHOW)
EndFunc   ;==>USBshow
Func UEFIhide()
	GUICtrlSetState($groupEF1, $GUI_HIDE)
	GUICtrlSetState($groupEF2, $GUI_HIDE)
	GUICtrlSetState($groupEF3, $GUI_HIDE)
	GUICtrlSetState($LabelEF2, $GUI_HIDE)
	GUICtrlSetState($LabelEF3, $GUI_HIDE)
	GUICtrlSetState($LabelEF4, $GUI_HIDE)
	GUICtrlSetState($LabelEF5, $GUI_HIDE)
	GUICtrlSetState($UEFIlabeexFat, $GUI_HIDE)
	GUICtrlSetState($UEFIInputexFat, $GUI_HIDE)
	GUICtrlSetState($UEFIICO, $GUI_HIDE)
	GUICtrlSetState($UEFIInputname, $GUI_HIDE)
	GUICtrlSetState($UEFIlabelname, $GUI_HIDE)
	GUICtrlSetState($UEFIInputinfo, $GUI_HIDE)
	GUICtrlSetState($UEFIlabelinfo, $GUI_HIDE)
	GUICtrlSetState($Combousbefi, $GUI_HIDE)
	GUICtrlSetState($UEFIback, $GUI_HIDE)
	GUICtrlSetState($UEFImake, $GUI_HIDE)
	GUICtrlSetState($Exituefi, $GUI_HIDE)
	GUICtrlSetState($efitip, $GUI_HIDE)
	GUICtrlSetState($efimakeISO, $GUI_HIDE)
EndFunc   ;==>UEFIhide
Func UEFIshow()
	GUICtrlSetState($groupEF1, $GUI_SHOW)
	GUICtrlSetState($groupEF2, $GUI_SHOW)
	GUICtrlSetState($groupEF3, $GUI_SHOW)
	GUICtrlSetState($LabelEF2, $GUI_SHOW)
	GUICtrlSetState($LabelEF3, $GUI_SHOW)
	GUICtrlSetState($LabelEF4, $GUI_SHOW)
	GUICtrlSetState($LabelEF5, $GUI_SHOW)
	GUICtrlSetState($UEFIlabeexFat, $GUI_SHOW)
	GUICtrlSetState($UEFIInputexFat, $GUI_SHOW)
	GUICtrlSetState($UEFIICO, $GUI_SHOW)
	GUICtrlSetState($UEFIInputname, $GUI_SHOW)
	GUICtrlSetState($UEFIlabelname, $GUI_SHOW)
	GUICtrlSetState($UEFIInputinfo, $GUI_SHOW)
	GUICtrlSetState($UEFIlabelinfo, $GUI_SHOW)
	GUICtrlSetState($Combousbefi, $GUI_SHOW)
	GUICtrlSetState($UEFIback, $GUI_SHOW)
	GUICtrlSetState($UEFImake, $GUI_SHOW)
	GUICtrlSetState($Exituefi, $GUI_SHOW)
	GUICtrlSetState($efitip, $GUI_SHOW)
	GUICtrlSetState($efimakeISO, $GUI_SHOW)
EndFunc   ;==>UEFIshow
Func UPshow()
	GUICtrlSetState($checkUP, $GUI_SHOW)
	GUICtrlSetState($groupUP1, $GUI_SHOW)
	GUICtrlSetState($groupUP2, $GUI_SHOW)
	GUICtrlSetState($Newweb, $GUI_SHOW)
	GUICtrlSetState($Newurl, $GUI_SHOW)
	GUICtrlSetState($EditUP1, $GUI_SHOW)
	GUICtrlSetState($EditUP2, $GUI_SHOW)
	GUICtrlSetState($homepage, $GUI_SHOW)
	GUICtrlSetState($groupUP3, $GUI_SHOW)
	GUICtrlSetState($Tutorialsjpg, $GUI_SHOW)
EndFunc   ;==>UPshow
Func UPhide()
	GUICtrlSetState($checkUP, $GUI_HIDE)
	GUICtrlSetState($groupUP1, $GUI_HIDE)
	GUICtrlSetState($groupUP2, $GUI_HIDE)
	GUICtrlSetState($Newweb, $GUI_HIDE)
	GUICtrlSetState($Newurl, $GUI_HIDE)
	GUICtrlSetState($EditUP1, $GUI_HIDE)
	GUICtrlSetState($EditUP2, $GUI_HIDE)
	GUICtrlSetState($homepage, $GUI_HIDE)
	GUICtrlSetState($groupUP3, $GUI_HIDE)
	GUICtrlSetState($Tutorialsjpg, $GUI_HIDE)
EndFunc   ;==>UPhide
Func _Setbmp($hWnd, $sFile, $nAlign = 0, $iWidth = 25, $iHeight = 25) ;�ؼ����, ͼ��ͼ���·��, ͼ������, ͼ���ڿؼ��е�λ��, ͼ����, ͼ��߶�
	$hImage1 = _GUIImageList_Create($iWidth, $iHeight, 5, 1, 0) ;����ͼ���б�ؼ�
	_GUIImageList_AddBitmap($hImage1, $sFile) ;��ͼ���б����ͼ��
	_GUICtrlButton_SetImageList($hWnd, $hImage1, $nAlign) ;����һ��ͼ���б���ť�ؼ���$nAlign ��ͼ��λ�ò���
EndFunc   ;==>_Setbmp
Func exfat()
	$DriveYesNo = StringRegExp(GUICtrlRead($Combousbefi), '(?<=\()[^)]+', 1);ʹ��������ʽ����Combousb�ؼ��е��ַ������õ�������hdx�������ַ���
	If @error Then
		;MsgBox(64 + 0, "����", "�����U�������б�����")
		;ExitProgram()
	Else
		$efipan = StringStripWS(GUICtrlRead($Combousbefi), 8);ǿ��ɾ����ȡ�����ַ����е����пո�
		$efipanfu = StringRight($efipan, 2);��ȡɾ���ո����ַ������ұ߿�ʼ��2���ַ�
		$efiusbsize = Floor(DriveSpaceTotal($efipanfu));ʹ��AU3��ȡWin�¿ɼ��ռ��С
		$efiusbfs = DriveGetFileSystem($efipanfu);ʹ��AU3��ȡWin�¿ɼ������ļ�ϵͳ��ʽ
		;����ֻ��ʹ��bootice����֤����Ҫ���ȸ���bootice.exe��C�̸�Ŀ¼��
		;RunWait('cmd.exe  /c  C:\bootice.exe  /DEVICE=' & $efipanfu & ' /diskinfo /file=C:\diskinfo.ini', "C:\", @SW_HIDE)
		GUICtrlSetData($UEFIInputexFat, "�ļ���ʽ: " & $efiusbfs & ", ������С: " & $efiusbsize & "MB.")
		If $efiusbfs = "exFat" Then
			GUICtrlSetData($efitip, "ѡ���U���ļ���ʽΪexFat,��֧��UEFI,������ѡ����˳����ʽΪU��ΪFat32")
			GUICtrlSetState($UEFImake, $GUI_DISABLE)
		Else
			GUICtrlSetData($efitip, "        Ϊȷ����������׼ȷ����,Ӧ�������б�����ʱͬʱ���Ӷ��U��.")
			GUICtrlSetState($UEFImake, $GUI_ENABLE)
		EndIf
	EndIf
EndFunc   ;==>exfat
Func _CPUGetIndividualProcessorTimes()
	Local $tagSYSTEM_PROCESSOR_TIMES = "int64 IdleTime;int64 KernelTime;int64 UserTime;int64 DpcTime;int64 InterruptTime;ulong InterruptCount;"
	Local $aRet, $stProcessorTimes, $stBuffer
	Local $i, $nTotalCPUStructs, $pStructPtr
	$stBuffer = DllStructCreate("byte Buffer[12288];")
	Local $aRet = DllCall("ntdll.dll", "long", "NtQuerySystemInformation", "int", 8, "ptr", DllStructGetPtr($stBuffer), "ulong", 12288, "ulong*", 0)
	If @error Then Return SetError(2, @error, "")
	If $aRet[0] Then Return SetError(3, $aRet[0], "")
	If $aRet[4] = 0 Or $aRet[0] > 12288 Or Mod($aRet[4], 48) <> 0 Then Return SetError(4, $aRet[4], "")
	$nTotalCPUStructs = $aRet[4] / 48
	Dim $aRet[$nTotalCPUStructs + 1][3]
	$aRet[0][0] = $nTotalCPUStructs
	$pStructPtr = DllStructGetPtr($stBuffer)
	For $i = 1 To $nTotalCPUStructs
		$stProcessorTimes = DllStructCreate($tagSYSTEM_PROCESSOR_TIMES, $pStructPtr)
		$aRet[$i][0] = DllStructGetData($stProcessorTimes, "IdleTime")
		$aRet[$i][1] = DllStructGetData($stProcessorTimes, "KernelTime")
		$aRet[$i][2] = DllStructGetData($stProcessorTimes, "UserTime")
		$pStructPtr += 48
	Next
	Return SetExtended($nTotalCPUStructs, $aRet)
EndFunc   ;==>_CPUGetIndividualProcessorTimes
Func _CPUsUsageTracker_Create()
	Local $nTotalCPUs, $aCPUTimes, $aCPUsUsage
	$aCPUTimes = _CPUGetIndividualProcessorTimes()
	If @error Then Return SetError(@error, @extended, "")
	$nTotalCPUs = @extended
	Dim $aCPUsUsage[$nTotalCPUs + 1][2]
	$aCPUsUsage[0][0] = $nTotalCPUs
	For $i = 1 To $nTotalCPUs
		$aCPUsUsage[$i][0] = $aCPUTimes[$i][1] + $aCPUTimes[$i][2]
		$aCPUsUsage[$i][1] = $aCPUTimes[$i][1] + $aCPUTimes[$i][2] - $aCPUTimes[$i][0]
	Next
	Return SetExtended($nTotalCPUs, $aCPUsUsage)
EndFunc   ;==>_CPUsUsageTracker_Create
Func _CPUOverallUsageTracker_Create()
	Local $aCPUTimes, $aCPUsUsage[2]
	$aCPUTimes = _CPUGetTotalProcessorTimes()
	If @error Then Return SetError(@error, @extended, "")
	$aCPUsUsage[0] = $aCPUTimes[1] + $aCPUTimes[2]
	$aCPUsUsage[1] = $aCPUTimes[1] + $aCPUTimes[2] - $aCPUTimes[0]
	Return $aCPUsUsage
EndFunc   ;==>_CPUOverallUsageTracker_Create
Func _CPUsUsageTracker_GetUsage(ByRef $aCPUsUsage)
	If Not IsArray($aCPUsUsage) Or UBound($aCPUsUsage, 2) < 2 Then Return SetError(1, 0, "")
	Local $nTotalCPUs, $aUsage, $aCPUsCurInfo
	Local $nTotalActive, $nTotal
	Local $nOverallActive, $nOverallTotal
	$aCPUsCurInfo = _CPUsUsageTracker_Create()
	If @error Then Return SetError(@error, @extended, "")
	$nTotalCPUs = $aCPUsCurInfo[0][0]
	Dim $aUsage[$nTotalCPUs + 1]
	$nOverallActive = 0
	$nOverallTotal = 0
	For $i = 1 To $nTotalCPUs
		$nTotal = $aCPUsCurInfo[$i][0] - $aCPUsUsage[$i][0]
		$nTotalActive = $aCPUsCurInfo[$i][1] - $aCPUsUsage[$i][1]
		$aUsage[$i - 1] = Round($nTotalActive * 100 / $nTotal, 1)
		$nOverallActive += $nTotalActive
		$nOverallTotal += $nTotal
	Next
	$aUsage[$nTotalCPUs] = Round(($nOverallActive / $nTotalCPUs) * 100 / ($nOverallTotal / $nTotalCPUs), 1)
	$aCPUsUsage = $aCPUsCurInfo
	Return SetExtended($nTotalCPUs, $aUsage)
EndFunc   ;==>_CPUsUsageTracker_GetUsage
Func _CPUOverallUsageTracker_GetUsage(ByRef $aCPUsUsage)
	If Not IsArray($aCPUsUsage) Or UBound($aCPUsUsage) < 2 Then Return SetError(1, 0, "")
	Local $aCPUsCurInfo, $fUsage, $nTotalActive, $nTotal
	$aCPUsCurInfo = _CPUOverallUsageTracker_Create()
	If @error Then Return SetError(@error, @extended, 0)
	$nTotal = $aCPUsCurInfo[0] - $aCPUsUsage[0]
	$nTotalActive = $aCPUsCurInfo[1] - $aCPUsUsage[1]
	$aCPUsUsage = $aCPUsCurInfo
	Return Round($nTotalActive * 100 / $nTotal, 1)
EndFunc   ;==>_CPUOverallUsageTracker_GetUsage
Func _CPUGetTotalProcessorTimes()
	Local $aRet, $stSystemTimes
	$stSystemTimes = DllStructCreate("int64 IdleTime;int64 KernelTime;int64 UserTime;")
	$aRet = DllCall("kernel32.dll", "bool", "GetSystemTimes", "ptr", DllStructGetPtr($stSystemTimes, 1), _
			"ptr", DllStructGetPtr($stSystemTimes, 2), "ptr", DllStructGetPtr($stSystemTimes, 3))
	If @error Then Return SetError(2, @error, "")
	If Not $aRet[0] Then Return SetError(3, 0, "")
	Dim $aRet[3] = [ _
			DllStructGetData($stSystemTimes, 1), _
			DllStructGetData($stSystemTimes, 2), _
			DllStructGetData($stSystemTimes, 3)]
	Return $aRet
EndFunc   ;==>_CPUGetTotalProcessorTimes
Func update()
	$getVersion = IniRead($tmpDirs & "\rpkusbinfo.ini", "USB", "version", "-1")
	$getDate = IniRead($tmpDirs & "\rpkusbinfo.ini", "USB", "date", "-1")
	$getSize = IniRead($tmpDirs & "\rpkusbinfo.ini", "USB", "size", "-1")
	$getWeb = IniRead($tmpDirs & "\rpkusbinfo.ini", "USB", "web", "-1")
	$getUrl = IniRead($tmpDirs & "\rpkusbinfo.ini", "USB", "url", "-1")
	$getinfo = InetGet("http://www.repaik.com/rpkusbinfonew.ini", $tmpDirs & "\rpkusbinfonew.ini", 1, 0)
	If $getinfo = 0 And FileGetSize($tmpDirs & "\rpkusbinfonew.ini") = 0 Then
		GUICtrlSetData($EditUP1, "����°汾ʧ�ܣ����粻ͨ������̳��������æ�У����Ժ�����")
		GUICtrlSetData($EditUP2, "��ǰ����汾:" & $getVersion & "  ��������:" & $getDate & " �����С:" & $getSize)
	EndIf
	If $getinfo <> 0 And FileGetSize($tmpDirs & "\rpkusbinfonew.ini") <> 0 Then
		$getnewVersion = IniRead($tmpDirs & "\rpkusbinfonew.ini", "USB", "version", "-1")
		$getnewDate = IniRead($tmpDirs & "\rpkusbinfonew.ini", "USB", "date", "-1")
		$getnewSize = IniRead($tmpDirs & "\rpkusbinfonew.ini", "USB", "size", "-1")
		$getnewWeb = IniRead($tmpDirs & "\rpkusbinfonew.ini", "USB", "web", "-1")
		$getnewUrl = IniRead($tmpDirs & "\rpkusbinfonew.ini", "USB", "url", "-1")
		;
		If $getnewDate <> $getDate Then
			GUICtrlSetData($EditUP1, "��ϲ�㣬�����鵽һ���µ���ɿ�װ�����������ѡ���Ƿ����")
			GUICtrlSetData($EditUP2, "��鵽�°汾��" & $getnewVersion & ",��������Ϊ" & $getnewDate & ",��СΪ" & $getnewSize)
		EndIf
		If $getnewDate = $getDate Then
			GUICtrlSetData($EditUP1, "��ʱû���°汾���������Ժ����ԣ�")
			GUICtrlSetData($EditUP2, "��ǰ����汾:" & $getVersion & "  ��������:" & $getDate & " �����С:" & $getSize)
		EndIf
	EndIf
EndFunc   ;==>update
Func _FileCopy($fromFile, $tofile, $option = 16)
	$winShell = ObjCreate("shell.application")
	$winShell.namespace($tofile).CopyHere($fromFile, $option)
EndFunc   ;==>_FileCopy
Func HashEFI()
	If $UEFIYES = 1 Then
		FileInstall("hash.exe", "C:\hash.exe", 1)
		$file = "C:\RPK.efiinfo.txt"
		FileDelete($file)
		RunWait('cmd.exe  /c  C:\hash.exe  -h   ' & @ScriptDir & "\RPK.efi > " & $file, "C:", @SW_HIDE)
		$EFIread = FileOpen($file)
		$EFIStr = FileReadLine($EFIread, 9)
		$EFIMD5S1 = StringStripWS($EFIStr, 8)
		$EFIMD5 = StringTrimLeft($EFIMD5S1, 4)
		If $EFIMD5 <> "7B56DC4862236F6AE3EC6E77788A2537" Or $EFIMD5 <> "9BB8BD44F36FBB4ABD74D01AE063439C" Then
			$EFIHASH = 0
		EndIf
		If $EFIMD5 = "7B56DC4862236F6AE3EC6E77788A2537" Or $EFIMD5 = "9BB8BD44F36FBB4ABD74D01AE063439C" Then
			$EFIHASH = 1
		EndIf
		FileDelete($file)
		FileDelete("C:\hash.exe")
	EndIf
	If $UEFIYES = 0 Then
		$EFIHASH = 0
	EndIf
EndFunc   ;==>HashEFI

Func export()
	TrayTip("С������ʾ", "�������ڵ���fbaԴ�ļ���...", 6, 1)
	FileInstall("Rpkusbfbasource.fba", @ScriptDir & "\Rpkusbfbasource.fba", 1)
	MsgBox(64 + 0, "��ϲ", "���������fbaԴ�ļ��ɹ���" & @CRLF & "�����������ʹ��fbinstTool�����Լ���YY֮��!", 35)
EndFunc   ;==>export
