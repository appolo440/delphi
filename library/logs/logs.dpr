library logs;
uses
  Windows,
  System.SysUtils,
  System.Classes,
  logsunit in 'logsunit.pas' {LogsForm};

{$R *.res}

procedure CreateLogsForm; stdcall;
begin
  LogsForm:= TLogsForm.Create(nil);
end;

procedure CloseLogsForm; stdcall;
begin
 LogsForm.Free;
end;

procedure AddLogs(const value: String); stdcall;
begin
  LogsForm.Memo.Lines.Add(DateToStr(Date) + FormatDateTime(' hh:mm ', Time) + value);
end;

procedure SaveLogs; stdcall;
var CurDate : TDateTime;
begin
 CurDate:= now;
 LogsForm.Memo.Lines.SaveToFile(ExtractFilePath(ParamStr(0)) + 'logs\' + FormatDateTime('hhmmss-dd.mm.yyyy', CurDate) + '.log');
end;

procedure ShowLogs; stdcall;
begin
 LogsForm.ShowModal;
end;

exports CreateLogsForm, CloseLogsForm, AddLogs, SaveLogs, ShowLogs;

begin
end.
