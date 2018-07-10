unit myServer_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 06.06.2018 21:00:03 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Users\Антон\Desktop\Уник\БД\Ковалёв\server\myServer.tlb (1)
// LIBID: {32F97350-C61D-42BE-B4C9-9D38FBCE0760}
// LCID: 0
// Helpfile: 
// HelpString: myServer Library
// DepndLst: 
//   (1) v1.0 Midas, (C:\WINDOWS\SysWOW64\midas.dll)
//   (2) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, Midas, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  myServerMajorVersion = 1;
  myServerMinorVersion = 0;

  LIBID_myServer: TGUID = '{32F97350-C61D-42BE-B4C9-9D38FBCE0760}';

  IID_IMyServerCl: TGUID = '{8EE7AED8-55D5-440C-B7D5-FD209F1473A8}';
  CLASS_MyServerCl: TGUID = '{9D4A636F-014A-459C-A293-C2DFDCCFFD07}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IMyServerCl = interface;
  IMyServerClDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  MyServerCl = IMyServerCl;


// *********************************************************************//
// Interface: IMyServerCl
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8EE7AED8-55D5-440C-B7D5-FD209F1473A8}
// *********************************************************************//
  IMyServerCl = interface(IAppServer)
    ['{8EE7AED8-55D5-440C-B7D5-FD209F1473A8}']
    procedure smUpdateTovar(ID: Integer; const Name: WideString); safecall;
    procedure smDeleteTovar(ID: Integer); safecall;
    procedure smUpdateClient(ID: Integer; const Name: WideString; const Adress: WideString); safecall;
    procedure smDeleteClient(ID: Integer); safecall;
    procedure smUpdateDogovor(ID: Integer; ClientID: Integer; Date: TDateTime; totalsum: Double; 
                              oplata: Double); safecall;
    procedure smDeleteDogovor(ID: Integer); safecall;
    procedure smDeleteD_T(TovarID: Integer; DogovorID: Integer); safecall;
    procedure smUpdateD_T(TovarID: Integer; DogovorID: Integer; kolvo: Integer; Date: TDateTime; 
                          OPLATA: Double; PRICE: Double); safecall;
    procedure smSQLClear; safecall;
    procedure smSQLAddString(const s: WideString); safecall;
    procedure smSQLExecute; safecall;
    procedure smUpdateTMP(ID: Integer; const Name: WideString; kolvo: Integer; kolvoo: Integer); safecall;
    procedure smDeleteTMP(ID: Integer); safecall;
  end;

// *********************************************************************//
// DispIntf:  IMyServerClDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8EE7AED8-55D5-440C-B7D5-FD209F1473A8}
// *********************************************************************//
  IMyServerClDisp = dispinterface
    ['{8EE7AED8-55D5-440C-B7D5-FD209F1473A8}']
    procedure smUpdateTovar(ID: Integer; const Name: WideString); dispid 301;
    procedure smDeleteTovar(ID: Integer); dispid 302;
    procedure smUpdateClient(ID: Integer; const Name: WideString; const Adress: WideString); dispid 303;
    procedure smDeleteClient(ID: Integer); dispid 304;
    procedure smUpdateDogovor(ID: Integer; ClientID: Integer; Date: TDateTime; totalsum: Double; 
                              oplata: Double); dispid 305;
    procedure smDeleteDogovor(ID: Integer); dispid 306;
    procedure smDeleteD_T(TovarID: Integer; DogovorID: Integer); dispid 308;
    procedure smUpdateD_T(TovarID: Integer; DogovorID: Integer; kolvo: Integer; Date: TDateTime; 
                          OPLATA: Double; PRICE: Double); dispid 307;
    procedure smSQLClear; dispid 313;
    procedure smSQLAddString(const s: WideString); dispid 314;
    procedure smSQLExecute; dispid 315;
    procedure smUpdateTMP(ID: Integer; const Name: WideString; kolvo: Integer; kolvoo: Integer); dispid 309;
    procedure smDeleteTMP(ID: Integer); dispid 310;
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer; 
                             out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                           Options: Integer; const CommandText: WideString; var Params: OleVariant; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoMyServerCl provides a Create and CreateRemote method to          
// create instances of the default interface IMyServerCl exposed by              
// the CoClass MyServerCl. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoMyServerCl = class
    class function Create: IMyServerCl;
    class function CreateRemote(const MachineName: string): IMyServerCl;
  end;

implementation

uses ComObj;

class function CoMyServerCl.Create: IMyServerCl;
begin
  Result := CreateComObject(CLASS_MyServerCl) as IMyServerCl;
end;

class function CoMyServerCl.CreateRemote(const MachineName: string): IMyServerCl;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MyServerCl) as IMyServerCl;
end;

end.
