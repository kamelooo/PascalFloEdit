program MyApp;

{$mode objfpc}{$H+}

uses
  SysUtils, AndroidWidget;

var
  Activity: JActivity;
  Button: JButton;
  TextView: JTextView;

procedure OnButtonClick(View: JView);
begin
  TextView.setText(StringToJString('لقد تم الضغط على الزر!'));
end;

begin
  // استدعاء الواجهة
  Activity := TAndroidHelper.Activity;
  Button := TJButton.JavaClass.init(Activity);
  TextView := TJTextView.JavaClass.init(Activity);

  // إعداد واجهة المستخدم
  TextView.setText(StringToJString('مرحبًا بك في تطبيقنا!'));
  Button.setText(StringToJString('اضغط هنا'));
  
  // إعداد الأحداث
  Button.setOnClickListener(TJView_OnClickListener.Create(@OnButtonClick));

  // إضافة العناصر إلى الشاشة
  Activity.setContentView(TJLinearLayout.JavaClass.init(Activity));
  TJLinearLayout(Activity.getContentView()).addView(TextView);
  TJLinearLayout(Activity.getContentView()).addView(Button);
end.