 OTP Input Auto Read Widget

A fully customizable OTP input widget with SMS auto-read support for Flutter.
---
## ✨ Feature Preview

- 4 & 6 digit OTP support
- Auto SMS OTP read (Android)
- Customizable box size & spacing
- Custom border colors (focused, filled, normal)
- Custom border radius
- Paste full OTP support
- Backspace support
- Cursor support
- Clean & production ready


---
## Preview 


![otp_demo](https://github.com/user-attachments/assets/b0012c86-2ad8-44d1-9bf0-799bea3b2e7d)



https://github.com/user-attachments/assets/79762433-6115-41b6-804e-b8b7e0af88f5


---
## 📦 Installation

Add this to your pubspec.yaml:
```
dependencies:
  otp_input_auto_read_widget:
    path: ../
```
Then run:
```
flutter pub get
```
---

## 📂 File Structure
```
otp_input_auto_read_widget/
│
├── lib/
│   ├── otp_input_auto_read_widget.dart     ← Main export file
│   └── src/
│       └── otp_input_auto_read.dart        ← SmartOtpField code
│
├── example/
│   ├── lib/
│   │   └── main.dart
│   ├── pubspec.yaml
│   └── (auto generated android/ios/etc)
│
├── preview/
│   └── otp_demo.jpg
│
├── test/
│   └── otp_input_auto_read_widget_test.dart
│
├── README.md
├── CHANGELOG.md
├── LICENSE
├── analysis_options.yaml
└── pubspec.yaml

```
---

## 🚀 Usage
```
import 'package:otp_input_auto_read_widget/otp_input_auto_read_widget.dart';
SmartOtpField(
  length: 4,
  autoRead: true,
  onCompleted: (otp) {
    print("Entered OTP: $otp");
  },
)

```

## ⚙️ Parameters
| Parameter          | Description                |
| ------------------ | -------------------------- |
| length             | OTP length (4 or 6)        |
| autoRead           | Enable SMS auto read       |
| boxSize            | Size of each box           |
| spacing            | Space between boxes        |
| borderRadius       | Box border radius          |
| borderColor        | Default border color       |
| focusedBorderColor | Border when focused        |
| filledBorderColor  | Border when filled         |
| fillColor          | Box background color       |
| textStyle          | OTP text style             |
| onCompleted        | Callback when OTP complete |


---
---

## 📄 License
MIT License
```
Copyright (c) 2026

Permission is hereby granted, free of charge, to any person obtaining a copy
of this Custom Calender library and associated documentation files
(the "Software"), to deal in the Software without restriction...
```
