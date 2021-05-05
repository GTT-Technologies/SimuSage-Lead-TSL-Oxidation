program TSLOxidation_v2_111119;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, tachartlazaruspkg, ssv1lazrt, TSL_Oxid, SysUtils
  { you can add units after this };

{$R *.res}

begin
  // I create an output file just before everything else, completely outside of the flowsheet calculation
  filename := 'LeadSmelting.txt';
  AssignFile(Output, filename);
  try
    rewrite(Output);
    writeln(Output);
    Closefile(Output);
  except
    //If there was an error the cause can be found here
    on E: EInOutError do
    writeln('File handling error occurred. Details: ', E.ClassName, '/', E.Message);
  end;

  //RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

