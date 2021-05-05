unit TSL_Oxid;

{$mode objfpc}{$H+}

interface

uses
  Classes, Math, SysUtils, FileUtil, TAGraph, TASeries, TAStyles, Forms, Controls,
  Graphics, Dialogs, ComCtrls, ExtCtrls, StdCtrls, PbStream, PbInputStreams,
  PbIterator, PbOutputUnit, PbRun, PbInspector, PbInpUtil, PbLogger,
  PbGttBalance, PbSplitter2, cadint, PbPhaseSplitter, PbNewMixer, Types, PbUnit;

type

  { TForm1 }

  TForm1 = class(TForm)
    CaCO3: TPbInputStream;
    CaCO3_FE: TPbFloatEdit;
    Chart2: TChart;
    Chart1: TChart;
    Bullion_series: TLineSeries;
    CaOSlag_Series: TLineSeries;
    Chart3: TChart;
    Chart4: TChart;
    Chart5: TChart;
    ConcMix: TPbMixer;
    FrSpCM: TPbSplitter2;
    CM_FrSpCM: TPbStream;
    FrSpCM_R4: TPbStream;
    FrSpCM_R3: TPbStream;
    FrSpCM_FE: TPbFloatEdit;
    ConcMix_FE: TPbFloatEdit;
    Label9: TLabel;
    Mix2: TPbMixer;
    FrSpR71_FE: TPbFloatEdit;
    FrSpR71: TPbSplitter2;
    FrSpR71_R1: TPbStream;
    FrSpR71_R3: TPbStream;
    PhSpB: TPbPhaseSplitter;
    PhSpB_M_Mix2: TPbStream;
    PhSpB_All_Mix2: TPbStream;
    Mix2_FrSpR12: TPbStream;
    Slag_heel2_FE: TPbFloatEdit;
    pO2_R5_Series: TLineSeries;
    pO2_R4_Series: TLineSeries;
    pO2_R3_Series: TLineSeries;
    IndiumGas_Series: TLineSeries;
    IndiumSlag_Series: TLineSeries;
    IndiumBullion_Series: TLineSeries;
    Results4: TTabSheet;
    Results5: TTabSheet;
    ZincGas_Series: TLineSeries;
    SO2Gas_Series: TLineSeries;
    NitrogenGas_Series: TLineSeries;
    LeadGas_Series: TLineSeries;
    LeadSulfideGas_Series: TLineSeries;
    ZincSlag_Series: TLineSeries;
    LeadSlag_Series: TLineSeries;
    Label8: TLabel;
    PbLogger1: TPbLogger;
    TotalTime_FE: TPbFloatEdit;
    Slag_series: TLineSeries;
    Matte_series: TLineSeries;
    Coal: TPbInputStream;
    Coal_FE: TPbFloatEdit;
    FrSpR11: TPbSplitter2;
    FrSpR11_FE: TPbFloatEdit;
    FrSpR11_PhSpB: TPbStream;
    FrSpR12: TPbSplitter2;
    FrSpR12_FE: TPbFloatEdit;
    FrSpR12_R2: TPbStream;
    FrSpR2: TPbSplitter2;
    FrSpR2_FE: TPbFloatEdit;
    FrSpR2_Mt_It10: TPbStream;
    FrSpR2_Mt_R3: TPbStream;
    FrSpR31: TPbSplitter2;
    FrSpR31_FE: TPbFloatEdit;
    FrSpR31_FrSpR32: TPbStream;
    FrSpR32: TPbSplitter2;
    FrSpR32_FE: TPbFloatEdit;
    FrSpR32_FrSpR33: TPbStream;
    FrSpR32_FrSpR34: TPbStream;
    FrSpR33: TPbSplitter2;
    FrSpR33_FE: TPbFloatEdit;
    FrSpR33_R4: TPbStream;
    FrSpR33_R5: TPbStream;
    FrSpR34: TPbSplitter2;
    FrSpR34_FE: TPbFloatEdit;
    FrSpR7: TPbSplitter2;
    FrSpR7_FE: TPbFloatEdit;
    FrSpR7_FrSpR71: TPbStream;
    FrSpR7_R4: TPbStream;
    Fuel: TPbInputStream;
    Fuel_FE: TPbFloatEdit;
    H2O: TPbInputStream;
    H2O_FE: TPbFloatEdit;
    InConc: TPbInputStream;
    InConc_FE: TPbFloatEdit;
    InR1_It1: TPbInputStream;
    InR1_It1_FE: TPbFloatEdit;
    InR1_It2: TPbInputStream;
    InR1_It2_FE: TPbFloatEdit;
    InR2_It10: TPbInputStream;
    InR2_It10_FE: TPbFloatEdit;
    InR2_It3: TPbInputStream;
    InR2_It3_FE: TPbFloatEdit;
    InR2_It8: TPbInputStream;
    InR2_It8_FE: TPbFloatEdit;
    InR2_It9: TPbInputStream;
    InR2_It9_FE: TPbFloatEdit;
    InR3_It4: TPbInputStream;
    InR3_It4_FE: TPbFloatEdit;
    InR3_It5: TPbInputStream;
    InR3_It5_FE: TPbFloatEdit;
    InR3_It6: TPbInputStream;
    InR3_It6_FE: TPbFloatEdit;
    InR4_It7: TPbInputStream;
    InR4_It7_FE: TPbFloatEdit;
    InSlag: TPbInputStream;
    InSlag_FE: TPbFloatEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    LanceAir_FE: TPbFloatEdit;
    Lance_Air: TPbInputStream;
    Memo1: TMemo;
    MTS_Out: TPbStream;
    O2: TPbInputStream;
    O2_FE: TPbFloatEdit;
    PageControl1: TPageControl;
    InConc2: TPbInputStream;
    InAir: TPbInputStream;
    FrSpR6_FE: TPbFloatEdit;
    InAir_FE: TPbFloatEdit;
    InConc2_FE: TPbFloatEdit;
    PbInspector1: TPbInspector;
    Iterator: TPbInStreamIterator;
    Out: TPbOutputUnit;
    It1_R1: TPbStream;
    It10_R2: TPbStream;
    It2_R1: TPbStream;
    It3_R2: TPbStream;
    It4_R3: TPbStream;
    It5_R3: TPbStream;
    It6_R3: TPbStream;
    It7_R4: TPbStream;
    It8_R2: TPbStream;
    It9_R2: TPbStream;
    PbRun1: TPbRun;
    PhSpR2: TPbPhaseSplitter;
    PhSpR2_Mt_FrSpR2: TPbStream;
    PhSpR2_M_It1: TPbStream;
    PhSpR2_SG_R3: TPbStream;
    PhSpR3: TPbPhaseSplitter;
    PhSpR3_G_R5: TPbStream;
    PhSpR3_Mt_It9: TPbStream;
    PhSpR3_M_It8: TPbStream;
    PhSpR3_S_FrSpR31: TPbStream;
    PhSpR4: TPbPhaseSplitter;
    PhSpR4_All_It6: TPbStream;
    PhSpR4_G_R5: TPbStream;
    PhSpR5_All_It5: TPbStream;
    FrSpR6_Dust_Out: TPbStream;
    FrSpR6_Dust_It7: TPbStream;
    PhSpR6_G_Out: TPbStream;
    PhSpR6: TPbPhaseSplitter;
    FrSpR6: TPbSplitter2;
    PhSpR5_G_R6: TPbStream;
    R1: TPbGttBalance;
    R1_FrSpR11: TPbStream;
    R1_It2: TPbStream;
    R2: TPbGttBalance;
    R2_PhSpR2: TPbStream;
    R3: TPbGttBalance;
    R3_It3: TPbStream;
    R3_It4: TPbStream;
    R3_PhSpR3: TPbStream;
    R4: TPbGttBalance;
    R4_PhSpR4: TPbStream;
    R5: TPbGttBalance;
    R5_PhSpR5: TPbStream;
    R6_PhSpR6: TPbStream;
    PhSpR6_All_FrSpR6: TPbStream;
    R6: TPbGttBalance;
    PhSpR5: TPbPhaseSplitter;
    R7: TPbGttBalance;
    R7_FrSpR7: TPbStream;
    ScrollBox1: TScrollBox;
    Shroud: TPbInputStream;
    Shroud_FE: TPbFloatEdit;
    Slag_heel: TPbInputStream;
    Slag_heel1_FE: TPbFloatEdit;
    STS_Out: TPbStream;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Results1: TTabSheet;
    Results2: TTabSheet;
    Results3: TTabSheet;
    procedure ConcMixBeforeCalculation(sender: TPbUnit);
    procedure FrSpCM_FEChange(Sender: TObject);
    procedure FrSpR32_FEChange(Sender: TObject);
    procedure FrSpR7BeforeCalculation(sender: TPbUnit);
    procedure Image1Click(Sender: TObject);
    procedure InConc_FEChange(Sender: TObject);
    procedure IteratorBeforeCalculation(sender: TPbUnit);
    function IteratorCheckExit(sender: TPbUnit): Boolean;
    procedure IteratorInitNextStep(sender: TPbUnit);
    procedure Lance_AirClick(Sender: TObject);
    procedure O2_FEChange(Sender: TObject);
    procedure OutBeforeCalculation(sender: TPbUnit);
    procedure R1BeforeCalculation(sender: TPbUnit);
    procedure R2BeforeCalculation(sender: TPbUnit);
    procedure R3BeforeCalculation(sender: TPbUnit);
    procedure R4BeforeCalculation(sender: TPbUnit);
    procedure R5BeforeCalculation(sender: TPbUnit);
    procedure R6BeforeCalculation(sender: TPbUnit);
    procedure R7BeforeCalculation(sender: TPbUnit);
    procedure ScrollBox1Click(Sender: TObject);
    procedure TabSheet2ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
  private

  public

  end;

var
  Form1: TForm1;
  noerr: integer;
  //variables for tabular output
  i: integer;
  time: array of double;

  Matte_amount: array of double;
  Slag_amount: array of double;
  Bullion_amount: array of double;
  BullionM_amount: array of double;

  Pb_Slag: array of double;
  PbO_Slag: array of double;
  Zn_Slag: array of double;
  CaO_Slag: array of double;

  SO2_Gas: array of double;
  N2_Gas:  array of double;
  Pb_Gas:  array of double;
  PbS_Gas: array of double;
  Zn_Gas:  array of double;

  pO2_R3: array of double;
  pO2_R4: array of double;
  pO2_R5: array of double;


  Ca_OutDust, Cu_OutDust, Fe_OutDust, In_OutDust, Mg_OutDust, O_OutDust, Pb_OutDust, S_OutDust, Si_OutDust, Sn_OutDust, Zn_OutDust : array of double;

  //creating arrays to accumulate gas
  C_OutGas, Ca_OutGas, Cu_OutGas, Fe_OutGas, H_OutGas, In_OutGas, Mg_OutGas, N_OutGas, O_OutGas, Pb_OutGas, S_OutGas,
  Si_OutGas, Sn_OutGas, Zn_OutGas : array of double;

  Output: Textfile;
  filename: string;


implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

procedure TForm1.FrSpR32_FEChange(Sender: TObject);
begin

end;

procedure TForm1.FrSpCM_FEChange(Sender: TObject);
begin

end;

procedure TForm1.ConcMixBeforeCalculation(sender: TPbUnit);
var SPINI, SPFIN, Mratio, MR3, MR4, TIME, TIME_END: double;
begin


    TIME_END := 35.0;
    SPINI := 0.5;
    SPFIN := 1.0;
    TIME := double(Iterator.Iteration);

    if (TIME <= TIME_END)
    then
    begin
        FrSpCM.SplitFactor := SPINI + (SPFIN-SPINI)*(TIME/TIME_END);
        FrSpCm_FE.Flt:= FrSpCM.SplitFactor;
    end
    else
    begin
        FrSpCM.SplitFactor := SPFIN;
        FrSpCm_FE.Flt:= FrSpCM.SplitFactor;
    end;

end;

procedure TForm1.FrSpR7BeforeCalculation(sender: TPbUnit);
var SPINI, SPFIN, Mratio, MR3, MR4, TIME, TIME_END: double;

begin

  TIME_END := 35.0;
  SPINI := 0.5;
  SPFIN := 0.9;
  TIME := double(Iterator.Iteration);

  if (TIME <= TIME_END)
  then
      FrSpR7_FE.Flt := SPINI + (SPFIN-SPINI)*(TIME/TIME_END)
  else
      FrSpR7_FE.Flt := SPFIN;
end;

procedure TForm1.InConc_FEChange(Sender: TObject);
begin

end;

procedure TForm1.IteratorBeforeCalculation(sender: TPbUnit);
begin
  Slag_series.Clear;
  Matte_series.Clear;
  Bullion_series.Clear;

  LeadSlag_Series.Clear;
  ZincSlag_Series.Clear;
  CaOSlag_Series.Clear;

  SO2Gas_Series.Clear;
  NitrogenGas_Series.Clear;
  LeadGas_Series.Clear;
  ZincGas_Series.Clear;
  LeadSulfideGas_Series.Clear;

  IndiumBullion_Series.Clear;
  IndiumSlag_Series.Clear;
  IndiumGas_Series.Clear;

  setLength(time     , 1000);

  setLength( Matte_amount    , 1000);
  setLength( Slag_amount    , 1000);
  setLength( Bullion_amount   , 1000);
  setLength( BullionM_amount   , 1000);

  setLength(Pb_Slag     , 1000);
  setLength(PbO_Slag     , 1000);
  setLength(Zn_Slag     , 1000);
  setLength(CaO_Slag     , 1000);

  setLength(SO2_Gas     , 1000);
  setLength(N2_Gas     , 1000);
  setLength(Pb_Gas     , 1000);
  setLength(PbS_Gas     , 1000);
  setLength(Zn_Gas     , 1000);

  setLength(pO2_R3     , 1000);
  setLength(pO2_R4     , 1000);
  setLength(pO2_R5     , 1000);

  setLength(Ca_OutDust, 1000);
  setLength(Cu_OutDust, 1000);
  setLength(Fe_OutDust, 1000);
  setLength(In_OutDust, 1000);
  setLength(Mg_OutDust, 1000);
  setLength(O_OutDust, 1000);
  setLength(Pb_OutDust, 1000);
  setLength(S_OutDust, 1000);
  setLength(Si_OutDust, 1000);
  setLength(Sn_OutDust, 1000);
  setLength(Zn_OutDust, 1000);

  setLength(C_OutGas, 1000);
  setLength(Ca_OutGas, 1000);
  setLength(Cu_OutGas, 1000);
  setLength(Fe_OutGas, 1000);
  setLength(H_OutGas, 1000);
  setLength(In_OutGas, 1000);
  setLength(Mg_OutGas, 1000);
  setLength(N_OutGas, 1000);
  setLength(O_OutGas, 1000);
  setLength(Pb_OutGas, 1000);
  setLength(S_OutGas, 1000);
  setLength(Si_OutGas, 1000);
  setLength(Sn_OutGas, 1000);
  setLength(Zn_OutGas, 1000);



end;

function TForm1.IteratorCheckExit(sender: TPbUnit): Boolean;
//slag including solids
var MushySlag : double;
    Cu_OutBull, Fe_OutBull, In_OutBull, O_OutBull, Pb_OutBull, S_OutBull, Sn_OutBull, Zn_OutBull,DummyD : double;
    Ca_OutSlag, Cu_OutSlag, Fe_OutSlag, In_OutSlag, Mg_OutSlag, O_OutSlag, Pb_OutSlag, S_OutSlag, Si_OutSlag, Sn_OutSlag, Zn_OutSlag : double;

    //variables for dust elements totals
    Ca_OutDustT, Cu_OutDustT, Fe_OutDustT, In_OutDustT, Mg_OutDustT, O_OutDustT, Pb_OutDustT, S_OutDustT, Si_OutDustT, Sn_OutDustT, Zn_OutDustT : double;

    //variables for gas elements totals
    C_OutGasT, Ca_OutGasT, Cu_OutGasT, Fe_OutGasT, H_OutGasT, In_OutGasT, Mg_OutGasT, N_OutGasT, O_OutGasT, Pb_OutGasT, S_OutGasT, Si_OutGasT, Sn_OutGasT,
    Zn_OutGasT : double;

begin
  It1_R1.copyFromStream(PhSpR2_M_It1);
  It2_R1.copyFromStream(R1_It2);
  It3_R2.copyFromStream(R3_It3);
  It4_R3.copyFromStream(R3_It4);
  It5_R3.copyFromStream(PhSpR5_All_It5);
  It6_R3.copyFromStream(PhSpR4_All_It6);
  It7_R4.copyFromStream(FrSpR6_Dust_It7);
  It8_R2.copyFromStream(PhSpR3_M_It8);
  It9_R2.copyFromStream(PhSpR3_Mt_It9);
  It10_R2.copyFromStream(FrSpR2_Mt_It10);

  //writing out the slag, matte and bullion amounts
  Slag_series.AddXY(Iterator.Iteration,PhSpR3_S_FrSpR31.Kg);
  Matte_series.AddXY(Iterator.Iteration,PhSpR2_Mt_FrSpR2.Kg);
  Bullion_series.AddXY(Iterator.Iteration, R1_FrSpR11.Kg);

  MushySlag := PhSpR3_S_FrSpR31.GetPhaseKg('Slag-liq+Ideal-2#1') + PhSpR3_S_FrSpR31.GetPhaseKg('Spinel');

  //writing out the composition of the slag (liquid + Spinel)
  LeadSlag_Series.AddXY(Iterator.Iteration, 100*(0.9283*PhSpR3_S_FrSpR31.GetConstituentKg('Slag-liq+Ideal-2#1','PbO') + 0.8660*PhSpR3_S_FrSpR31.GetConstituentKg('Slag-liq+Ideal-2#1','PbS'))/MushySlag);

  ZincSlag_Series.AddXY(Iterator.Iteration, 100*(0.8034*PhSpR3_S_FrSpR31.GetConstituentKg('Slag-liq+Ideal-2#1','ZnO') + 0.6710*PhSpR3_S_FrSpR31.GetConstituentKg('Slag-liq+Ideal-2#1','ZnS'))/MushySlag);
  CaOSlag_Series.AddXY(Iterator.Iteration, 100*PhSpR3_S_FrSpR31.GetConstituentKg('Slag-liq+Ideal-2#1','CaO')/MushySlag);


  //writing out the composition of the gas
  SO2Gas_Series.AddXY(Iterator.Iteration, 100*PhSpR6_G_Out.GetConstituentKg('gas_ideal','SO2')/PhSpR6_G_Out.Kg);
  NitrogenGas_Series.AddXY(Iterator.Iteration, 100*PhSpR6_G_Out.GetConstituentKg('gas_ideal','N2')/PhSpR6_G_Out.Kg);
  LeadGas_Series.AddXY(Iterator.Iteration, 100*PhSpR6_G_Out.GetConstituentKg('gas_ideal','Pb')/PhSpR6_G_Out.Kg);
  ZincGas_Series.AddXY(Iterator.Iteration, 100*PhSpR6_G_Out.GetConstituentKg('gas_ideal','Zn')/PhSpR6_G_Out.Kg);
  LeadSulfideGas_Series.AddXY(Iterator.Iteration, 100*PhSpR6_G_Out.GetConstituentKg('gas_ideal','PbS')/PhSpR6_G_Out.Kg);

  //writing out the indium distribution
  IndiumBullion_Series.AddXY(Iterator.Iteration, 100*R1_FrSpR11.GetConstituentKg('Pb-liq+Ideal-1','In_L1(liq)_Ideal-1')/R1_FrSpR11.Kg);
  IndiumSlag_Series.AddXY(Iterator.Iteration, 100*0.8271*PhSpR3_S_FrSpR31.GetConstituentKg('Slag-liq+Ideal-2#1','In2O3_L1(liq)_Ideal-2')/MushySlag);
  IndiumGas_Series.AddXY(Iterator.Iteration, 100000*(0.9349*PhSpR6_G_Out.GetConstituentKg('gas_ideal','In2O') +
                                             0.8777*PhSpR6_G_Out.GetConstituentKg('gas_ideal','InO')  +
                                             PhSpR6_G_Out.GetConstituentKg('gas_ideal','In2')  +
                                             PhSpR6_G_Out.GetConstituentKg('gas_ideal','In') )/PhSpR6_G_Out.Kg);

  //writing out the O2 partial pressures
  if R3_PhSpR3.GetPhaseAmount('gas_ideal')>0 then
  pO2_R3_Series.AddXY(Iterator.Iteration,log10(R3_PhSpR3.GetConstituentAmount('gas_ideal','O2')/R3_PhSpR3.GetPhaseAmount('gas_ideal')));

  if R4_PhSpR4.GetPhaseAmount('gas_ideal')>0 then
  pO2_R4_Series.AddXY(Iterator.Iteration,log10(R4_PhSpR4.GetConstituentAmount('gas_ideal','O2')/R4_PhSpR4.GetPhaseAmount('gas_ideal')));

  if R5_PhSpR5.GetPhaseAmount('gas_ideal')>0 then
  pO2_R5_Series.AddXY(Iterator.Iteration,log10(R5_PhSpR5.GetConstituentAmount('gas_ideal','O2')/R5_PhSpR5.GetPhaseAmount('gas_ideal')));

  //writing a tabular output for the variables of interest

  if Iterator.Iteration=TotalTime_FE.Flt then
  begin
       Result:=True;
       filename:='LeadSmelting.txt';
       AssignFile(Output, filename);
       try
         append(Output);
         writeln(Output, 'time':24,
         'Matte amount(kg)':24, 'Slag amount(kg)':24, 'Bullion amount(kg)':24, 'BullionM amount (kg)':24,
         '%Pb in slag':24, '%PbO in Slag':24,'%Zn in slag':24, '%CaO in slag':24,
         '%SO2 in gas':24, '%N2 in gas':24, '%Pb in gas':24, '%PbS in gas':24, '%Zn in gas':24,
         'pO2 in R3':24, 'pO2 in R4':24, 'pO2 in R5':24);

         for i:=0 to Trunc(TotalTime_FE.Flt) do
             writeln(Output, time[i]:24:3,
             Matte_amount[i], Slag_amount[i], Bullion_amount[i], BullionM_amount[i],
             Pb_Slag[i], PbO_Slag[i], Zn_Slag[i], CaO_Slag[i],
             SO2_Gas[i], N2_Gas[i],Pb_Gas[i], PbS_Gas[i], Zn_Gas[i],
             pO2_R3[i]:24:3, pO2_R4[i]:24:3, pO2_R5[i]:24:3);

         writeln(Output);
         writeln(Output);

         //writing out the distribution factors for the bullion

         writeln(Output, ' ':24, 'C':24, 'Ca':24, 'Cu':24, 'Fe':24, 'H':24, 'In':24, 'Mg':24, 'N':24, 'O':24, 'Pb':24, 'S':24, 'Si':24, 'Sn':24, 'Zn':24);

         Cu_OutBull := PhSpB_M_Mix2.GetSystemComponentKg('Cu');
         Fe_OutBull := PhSpB_M_Mix2.GetSystemComponentKg('Fe');
         In_OutBull := PhSpB_M_Mix2.GetSystemComponentKg('In');
         O_OutBull  := PhSpB_M_Mix2.GetSystemComponentKg('O');
         Pb_OutBull := PhSpB_M_Mix2.GetSystemComponentKg('Pb');
         S_OutBull  := PhSpB_M_Mix2.GetSystemComponentKg('S');
         Sn_OutBull := PhSpB_M_Mix2.GetSystemComponentKg('Sn');
         Zn_OutBull := PhSpB_M_Mix2.GetSystemComponentKg('Zn');

         DummyD := 0.0;

         writeln(Output, 'Bullion':24, DummyD, DummyD, Cu_OutBull, Fe_OutBull, DummyD, In_OutBull, DummyD, DummyD,
         O_OutBull, Pb_OutBull, S_OutBull, DummyD, Sn_OutBull, Zn_OutBull);

         //writing out the distribution factors for the slag

         Ca_OutSlag := PhSpR3_S_FrSpR31.GetSystemComponentKg('Ca');
         Cu_OutSlag := PhSpR3_S_FrSpR31.GetSystemComponentKg('Cu');
         Fe_OutSlag := PhSpR3_S_FrSpR31.GetSystemComponentKg('Fe');
         In_OutSlag := PhSpR3_S_FrSpR31.GetSystemComponentKg('In');
         Mg_OutSlag := PhSpR3_S_FrSpR31.GetSystemComponentKg('Mg');
         O_OutSlag := PhSpR3_S_FrSpR31.GetSystemComponentKg('O');
         Pb_OutSlag := PhSpR3_S_FrSpR31.GetSystemComponentKg('Pb');
         S_OutSlag := PhSpR3_S_FrSpR31.GetSystemComponentKg('S');
         Si_OutSlag := PhSpR3_S_FrSpR31.GetSystemComponentKg('Si');
         Sn_OutSlag := PhSpR3_S_FrSpR31.GetSystemComponentKg('Sn');
         Zn_OutSlag := PhSpR3_S_FrSpR31.GetSystemComponentKg('Zn');

         writeln(Output, 'Slag':24, DummyD, Ca_OutSlag, Cu_OutSlag, Fe_OutSlag, DummyD, In_OutSlag, Mg_OutSlag, DummyD,
         O_OutSlag, Pb_OutSlag, S_OutSlag, Si_OutSlag, Sn_OutSlag, Zn_OutSlag);

         //writing  out the distribution factors for the dust
         Ca_OutDustT := 0.0;
         Cu_OutDustT := 0.0;
         Fe_OutDustT := 0.0;
         In_OutDustT := 0.0;
         Mg_OutDustT := 0.0;
         O_OutDustT := 0.0;
         Pb_OutDustT := 0.0;
         S_OutDustT := 0.0;
         Si_OutDustT := 0.0;
         Sn_OutDustT := 0.0;
         Zn_OutDustT := 0.0;

         for i:=0 to (Trunc(TotalTime_FE.Flt)-1) do
             begin
                 Ca_OutDustT := Ca_OutDustT + Ca_OutDust[i];
                 Cu_OutDustT := Cu_OutDustT + Cu_OutDust[i];
                 Fe_OutDustT := Fe_OutDustT + Fe_OutDust[i];
                 In_OutDustT := In_OutDustT + In_OutDust[i];
                 Mg_OutDustT := Mg_OutDustT + Mg_OutDust[i];
                 O_OutDustT := O_OutDustT + O_OutDust[i];
                 Pb_OutDustT := Pb_OutDustT + Pb_OutDust[i];
                 S_OutDustT := S_OutDustT + S_OutDust[i];
                 Si_OutDustT := Si_OutDustT + Si_OutDust[i];
                 Sn_OutDustT := Sn_OutDustT + Sn_OutDust[i];
                 Zn_OutDustT := Zn_OutDustT + Zn_OutDust[i];
             end;

         writeln(Output, 'Dust':24, DummyD, Ca_OutDustT, Cu_OutDustT, Fe_OutDustT, DummyD, In_OutDustT, Mg_OutDustT, DummyD,
         O_OutDustT, Pb_OutDustT, S_OutDustT, Si_OutDustT, Sn_OutDustT, Zn_OutDustT);

         //writing  out the distribution factors for the gas
         C_OutGasT := 0.0;
         Ca_OutGasT := 0.0;
         Cu_OutGasT := 0.0;
         Fe_OutGasT := 0.0;
         H_OutGasT := 0.0;
         In_OutGasT := 0.0;
         Mg_OutGasT := 0.0;
         N_OutGasT := 0.0;
         O_OutGasT := 0.0;
         Pb_OutGasT := 0.0;
         S_OutGasT := 0.0;
         Si_OutGasT := 0.0;
         Sn_OutGasT := 0.0;
         Zn_OutGasT := 0.0;

         for i:=0 to (Trunc(TotalTime_FE.Flt)-1) do
             begin
                 C_OutGasT := C_OutGasT + C_OutGas[i];
                 Ca_OutGasT := Ca_OutGasT + Ca_OutGas[i];
                 Cu_OutGasT := Cu_OutGasT + Cu_OutGas[i];
                 Fe_OutGasT := Fe_OutGasT + Fe_OutGas[i];
                 H_OutGasT :=  H_OutGasT + H_OutGas[i];
                 In_OutGasT := In_OutGasT + In_OutGas[i];
                 Mg_OutGasT := Mg_OutGasT + Mg_OutGas[i];
                 N_OutGasT := N_OutGasT + N_OutGas[i];
                 O_OutGasT := O_OutGasT + O_OutGas[i];
                 Pb_OutGasT := Pb_OutGasT + Pb_OutGas[i];
                 S_OutGasT := S_OutGasT + S_OutGas[i];
                 Si_OutGasT := Si_OutGasT + Si_OutGas[i];
                 Sn_OutGasT := Sn_OutGasT + Sn_OutGas[i];
                 Zn_OutGasT := Zn_OutGasT + Zn_OutGas[i];
             end;

         writeln(Output, 'Gas':24, C_OutGasT, Ca_OutGasT, Cu_OutGasT, Fe_OutGasT, H_OutGasT, In_OutGasT, Mg_OutGasT, N_OutGasT,
         O_OutGasT, Pb_OutGasT, S_OutGasT, Si_OutGasT, Sn_OutGasT, Zn_OutGasT);


         CloseFile(Output);
       except
         //If there was an error the cause can be found here
         on E: EInOutError do
         writeln('File handling error occurred. Details: ', E.ClassName, '/', E.Message);
       end
  end

  else

  begin
       Result:=False;
       time[Iterator.Iteration]:=Iterator.Iteration;

       Matte_amount[Iterator.Iteration]:= PhSpR2_Mt_FrSpR2.Kg;
       Slag_amount[Iterator.Iteration]:= PhSpR3_S_FrSpR31.Kg;
       Bullion_amount[Iterator.Iteration]:=  R1_FrSpR11.Kg;

       //Introducing a variable that contains only the metallic part of R1
       BullionM_amount[Iterator.Iteration]:=  PhSpB_M_Mix2.Kg;

       Pb_Slag[Iterator.Iteration]:= 100*(0.9283*PhSpR3_S_FrSpR31.GetConstituentKg('Slag-liq+Ideal-2#1','PbO') + 0.8660*PhSpR3_S_FrSpR31.GetConstituentKg('Slag-liq+Ideal-2#1','PbS'))/MushySlag;

       //PbO_Slag[Iterator.Iteration]:=  100*PhSpR3_S_FrSpR31.GetConstituentKg('Slag-liq+Ideal-2#1','PbO')/PhSpR3_S_FrSpR31.GetPhaseKg('Slag-liq+Ideal-2#1');

       //changed the reference for normalizing %PbO
       PbO_Slag[Iterator.Iteration]:=  100*PhSpR3_S_FrSpR31.GetConstituentKg('Slag-liq+Ideal-2#1','PbO')/MushySlag;
       Zn_Slag[Iterator.Iteration]:= 100*(0.8034*PhSpR3_S_FrSpR31.GetConstituentKg('Slag-liq+Ideal-2#1','ZnO') + 0.6710*PhSpR3_S_FrSpR31.GetConstituentKg('Slag-liq+Ideal-2#1','ZnS'))/MushySlag;
       CaO_Slag[Iterator.Iteration] := 100*PhSpR3_S_FrSpR31.GetConstituentKg('Slag-liq+Ideal-2#1','CaO')/MushySlag;

       SO2_Gas[Iterator.Iteration]:= 100*PhSpR6_G_Out.GetConstituentKg('gas_ideal','SO2')/PhSpR6_G_Out.Kg;
       N2_Gas[Iterator.Iteration]:= 100*PhSpR6_G_Out.GetConstituentKg('gas_ideal','N2')/PhSpR6_G_Out.Kg;
       Pb_Gas[Iterator.Iteration]:= 100*PhSpR6_G_Out.GetConstituentKg('gas_ideal','Pb')/PhSpR6_G_Out.Kg;
       PbS_Gas[Iterator.Iteration]:=  100*PhSpR6_G_Out.GetConstituentKg('gas_ideal','PbS')/PhSpR6_G_Out.Kg;
       Zn_Gas[Iterator.Iteration]:= 100*PhSpR6_G_Out.GetConstituentKg('gas_ideal','Zn')/PhSpR6_G_Out.Kg;

       if R3_PhSpR3.GetPhaseAmount('gas_ideal')>0 then
       pO2_R3[Iterator.Iteration]:= log10(R3_PhSpR3.GetConstituentAmount('gas_ideal','O2')/R3_PhSpR3.GetPhaseAmount('gas_ideal'));

       if R4_PhSpR4.GetPhaseAmount('gas_ideal')>0 then
       pO2_R4[Iterator.Iteration]:= log10(R4_PhSpR4.GetConstituentAmount('gas_ideal','O2')/R4_PhSpR4.GetPhaseAmount('gas_ideal'));

       if R5_PhSpR5.GetPhaseAmount('gas_ideal')>0 then
       pO2_R5[Iterator.Iteration]:= log10(R5_PhSpR5.GetConstituentAmount('gas_ideal','O2')/R5_PhSpR5.GetPhaseAmount('gas_ideal'));


       Ca_OutDust[Iterator.Iteration] := FrSpR6_Dust_Out.GetSystemComponentKg('Ca');
       Cu_OutDust[Iterator.Iteration] := FrSpR6_Dust_Out.GetSystemComponentKg('Cu');
       Fe_OutDust[Iterator.Iteration] := FrSpR6_Dust_Out.GetSystemComponentKg('Fe');
       In_OutDust[Iterator.Iteration] := FrSpR6_Dust_Out.GetSystemComponentKg('In');
       Mg_OutDust[Iterator.Iteration] := FrSpR6_Dust_Out.GetSystemComponentKg('Mg');
       O_OutDust[Iterator.Iteration] := FrSpR6_Dust_Out.GetSystemComponentKg('O');
       Pb_OutDust[Iterator.Iteration] := FrSpR6_Dust_Out.GetSystemComponentKg('Pb');
       S_OutDust[Iterator.Iteration] := FrSpR6_Dust_Out.GetSystemComponentKg('S');
       Si_OutDust[Iterator.Iteration] := FrSpR6_Dust_Out.GetSystemComponentKg('Si');
       Sn_OutDust[Iterator.Iteration] := FrSpR6_Dust_Out.GetSystemComponentKg('Sn');
       Zn_OutDust[Iterator.Iteration] := FrSpR6_Dust_Out.GetSystemComponentKg('Zn');

       //writing gas composition on array corresp

       C_OutGas[Iterator.Iteration] := PhSpR6_G_Out.GetSystemComponentKg('C');
       Ca_OutGas[Iterator.Iteration] := PhSpR6_G_Out.GetSystemComponentKg('Ca');
       Cu_OutGas[Iterator.Iteration] := PhSpR6_G_Out.GetSystemComponentKg('Cu');
       Fe_OutGas[Iterator.Iteration] := PhSpR6_G_Out.GetSystemComponentKg('Fe');
       H_OutGas[Iterator.Iteration] := PhSpR6_G_Out.GetSystemComponentKg('H');
       In_OutGas[Iterator.Iteration] := PhSpR6_G_Out.GetSystemComponentKg('In');
       Mg_OutGas[Iterator.Iteration] := PhSpR6_G_Out.GetSystemComponentKg('Mg');
       N_OutGas[Iterator.Iteration] := PhSpR6_G_Out.GetSystemComponentKg('N');
       O_OutGas[Iterator.Iteration] := PhSpR6_G_Out.GetSystemComponentKg('O');
       Pb_OutGas[Iterator.Iteration] := PhSpR6_G_Out.GetSystemComponentKg('Pb');
       S_OutGas[Iterator.Iteration] := PhSpR6_G_Out.GetSystemComponentKg('S');
       Si_OutGas[Iterator.Iteration] := PhSpR6_G_Out.GetSystemComponentKg('Si');
       Sn_OutGas[Iterator.Iteration] := PhSpR6_G_Out.GetSystemComponentKg('Sn');
       Zn_OutGas[Iterator.Iteration] := PhSpR6_G_Out.GetSystemComponentKg('Zn');



  end;
  AL.log(self, 'Iterator.Iteration='+InttoStr(Iterator.Iteration));
end;

procedure TForm1.IteratorInitNextStep(sender: TPbUnit);
begin
  //after the first iteration
  if iterator.Iteration>0 then
  begin
    InR1_It1.SetNewStream(It1_R1);
    InR1_It2.SetNewStream(It2_R1);
    InR2_It3.SetNewStream(It3_R2);
    InR3_It4.SetNewStream(It4_R3);
    InR3_It5.SetNewStream(It5_R3);
    InR3_It6.SetNewStream(It6_R3);
    InR4_It7.SetNewStream(It7_R4);
    InR2_It8.SetNewStream(It8_R2);
    InR2_It9.SetNewStream(It9_R2);
    InR2_It10.SetNewStream(It10_R2);
    FrSpR7.inputChanged;
  end;
  if iterator.Iteration=0 then
     begin
        Slag_heel.Kg:=Slag_heel1_FE.Flt;
     end
     else
     begin
        Slag_heel.Kg:=Slag_heel2_FE.Flt;
     end;

  R1.inputChanged;
  R7.inputChanged;
  R3.inputChanged;
  ConcMix.inputChanged;
  FrSpCM.inputChanged;
  FrSpR7.inputChanged;
end;

procedure TForm1.Lance_AirClick(Sender: TObject);
begin

end;

procedure TForm1.O2_FEChange(Sender: TObject);
begin

end;

procedure TForm1.OutBeforeCalculation(sender: TPbUnit);
begin

end;



procedure TForm1.R1BeforeCalculation(sender: TPbUnit);
begin
  cadint.tqconf('E ', 0, 0, 0, noerr);
end;

procedure TForm1.R2BeforeCalculation(sender: TPbUnit);
begin
  cadint.tqconf('E ', 0, 0, 0, noerr);
end;

procedure TForm1.R3BeforeCalculation(sender: TPbUnit);
begin
  cadint.tqconf('E ', 0, 0, 0, noerr);
end;

procedure TForm1.R4BeforeCalculation(sender: TPbUnit);
begin
  cadint.tqconf('E ', 0, 0, 0, noerr);
end;

procedure TForm1.R5BeforeCalculation(sender: TPbUnit);
begin
  cadint.tqconf('E ', 0, 0, 0, noerr);
end;

procedure TForm1.R6BeforeCalculation(sender: TPbUnit);
begin
  cadint.tqconf('E ', 0, 0, 0, noerr);
end;

procedure TForm1.R7BeforeCalculation(sender: TPbUnit);
begin
  cadint.tqconf('E ', 0, 0, 0, noerr);
end;

procedure TForm1.ScrollBox1Click(Sender: TObject);
begin

end;

procedure TForm1.TabSheet2ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

end.

