 # 🌟 SphereFinMobile (New Kashjoy)

> **แอปจัดการสินเชื่อและการชำระเงิน** รองรับการ **ถอนเงินแบบ Cardless, ชำระเงินด้วย QR/Barcode, แสดงใบแจ้งหนี PDF** และ **ค้นหาร้านค้าผ่านแผนที่**  
> พัฒนาโดย **Flutter** ด้วยแนวทาง **Clean Architecture** และ **State Management (flutter_bloc + Get_it)**

---

## 📌 **Table of Contents**
1. [Project Overview](#project-overview)
2. [Key Features](#key-features)
3. [Screenshots & UI Flow](#screenshots--ui-flow)
4. [Project Structure](#project-structure)
5. [Installation & Setup](#installation--setup)
6. [State Management & Architecture](#state-management--architecture)
7. [CI/CD & Deployment](#cicd--deployment)

---

## 🏆 **Project Overview**

**SphereFinMobile** เป็นแอปพลิเคชันสำหรับ **จัดการสินเชื่อและการชำระเงิน** โดยเน้นความสะดวก ปลอดภัย และรองรับ **Multi-Flavors (mock, sit, prod)**  

### 🛠 **Technologies Used**
- **Flutter (Dart)** – ใช้ **flutter_bloc (Cubit)** เป็น State Management
- **Get_it** – ใช้ Dependency Injection
- **Firebase** – รองรับ FCM และ Analytics
- **Fastlane** – สำหรับ CI/CD อัตโมัติ
- **Google Maps API** – สำหรับแสดงตำแหน่งร้านค้า

---

## 🚀 **Key Features**

✅ **ถอนเงินแบบ Cardless** – ถอนเงินจากบัญชีสินเชื่อโดยแอป  
✅ **QR/Barcode Payment** – สแกน QR Code หรือ Barcode เพื่อชำระเงิน  
✅ **PDF Billing** – ดาวน์โหลดและดูใบแจ้งหนีในรูปแบบ PDF  
✅ **Shop Location Map** – ค้นหาร้านค้าโดยแสดงแผนที่  
✅ **User Authentication** – รองรับระบบล็อกอินแบบปลอดภัย

---

## 📸 **Screenshots & UI Flow**

เพื่อให้เข้าใจภาพรวมของแอปได้ชัดเจนขึ้น นี่คือภาพหน้าจอของแอปที่แสดงฟังก์ชันหลัก:

<p align="center">
  <img src="path/to/map_screen.png" width="250" />
  <img src="path/to/home_screen.png" width="250" />
  <img src="path/to/account_screen.png" width="250" />
  <img src="path/to/transfer_screen.png" width="250" />
</p>

**Flow ของแอป:**
1️⃣ เปิดแอป → 2️⃣ เข้าสู่ระบบ → 3️⃣ ดูข้อมูลสินเชื่อ → 4️⃣ ชำระเงิน → 5️⃣ ดาวน์โหลดใบเสร็จ  

---
## 🏗️ Project Structure - SphereFinMobile

แอปพลิเคชันนี้ใช้แนวทาง **Clean Architecture** และจัดโครงสร้างแอปเป็นดังนี้:

```
assets/
├── config/
│   ├── config_th.json
├── fonts/
├── icons/
├── localizations/
│   ├── th.json
|
lib/
│
├── common/
│   ├── components/             # UI components ทั่วไป
│   ├── constants/              # ค่าคงที่ที่ใช้ทั่วแอป
│   ├── dialog/                 # Dialog ที่ใช้ซ้ำ
│   ├── fullpage/               # Full page popup
│   ├── tools/                  # เครื่องมือช่วยเหลือ เช่น Formatter, Validator
│
├── core/
│   ├── api/
│   │   ├── api_config.dart     # Mapping API config จาก env
│   │   ├── api_service.dart    # Interceptor สำหรับ Dio
│   ├── configuration/
│   │   ├── app_config.dart     # โหลด asset config_th.json หรือ API config_th
│   │   ├── app_flavor.dart     # Mapping Flavor
│   │   ├── placeholder_key.dart # Key สำหรับข้อความที่ต้องแทนค่า
│   │   ├── storage_key.dart    # Key สำหรับ local storage
│   │   ├── language_config.dart # Enum สำหรับภาษาที่รองรับ
│   ├── localization/
│   │   ├── app_localizations.dart # โหลด asset th.json หรือ API json
│   │   ├── model/
│   │   │   ├── common_label.dart
│   │   │   ├── home_label.dart
│   ├── module/
│   │   ├── app_base_module.dart # Abstract class สำหรับ data, domain layer
│   ├── provider/
│   │   ├── app_provider.dart    # รวม BlocProvider ของแต่ละ features
│   ├── route/
│   │   ├── app_route.dart       # Map key สำหรับ route name
│   ├── state/
│   │   ├── app_cubit.dart       # Abstract Cubit ที่มี init(), clear()
│   │   ├── app_state.dart       # Abstract stateful screen base
│
├── data/
│   ├── model/                   # JSON Object จาก API
│   ├── repository/
│   │   ├── mock_ex_repository.dart # Mock API data
│   │   ├── remote_ex_repository.dart # API จริงผ่าน Dio
│
├── domain/
│   ├── repository/
│   │   ├── ex_repository.dart   # Abstract class ของ API call
│
├── delegate/
│   ├── app_storage_mixin.dart   # Save/get storage
│   ├── application_mixin.dart   # Global function เช่น showAlert
│   ├── config_mixin.dart        # เรียก config_th.json แบบง่าย
│   ├── localization_mixin.dart  # เรียกข้อความจาก th.json
│
├── di/
│   ├── app_module.dart          # Register dependencies ใน Get_it
│
├── extensions/
│   ├── date_extension.dart
│   ├── string_extension.dart
│   ├── number_extension.dart
│
├── theme/
│   ├── app_colors.dart          # Field สีของแอป
│   ├── app_textstyle.dart       # Text styles
│   ├── app_theme.dart           # Base theme components
│
├── features/
│   ├── example/
│   │   ├── config/
│   │   │   ├── example_module.dart
│   │   │   ├── example_provider.dart
│   │   │   ├── example_route.dart
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   ├── example_model.dart
│   │   │   ├── repositories/
│   │   │   │   ├── mock_example_repository.dart
│   │   │   │   ├── remote_example_repository.dart
│   │   ├── domain/
│   │   │   ├── repositories/
│   │   │   │   ├── example_repository.dart
│   │   ├── presentation/
│   │   │   ├── example_cubit.dart
│   │   │   ├── example_state.dart
│   │   │   ├── example_screen.dart
```

---

## 🏛️ **State Management & Architecture**

แอปพลิเคชันนี้ใช้แนวทาง **Clean Architecture** และจัดโครงสร้างแอปเป็น 3 เลเยอร์หลัก:

1️⃣ **Data Layer** – จัดการ API และข้อมูล เช่น Repository, Models
2️⃣ **Domain Layer** – Business Logic และ Use Cases
3️⃣ **Presentation Layer** – UI และ State Management

### 📌 State Management
- ใช้ `flutter_bloc (Cubit)` สำหรับการจัดการ State
- ใช้ `Get_it` ในการ Inject Dependencies
- ใช้ `Dio` สำหรับ API Handling

---

## 🛠 **Installation & Setup**

### 📌 ติดตั้ง Dependencies
```bash
fvm flutter pub get
```

### 📌 รันแอปตาม Environment
```bash
fvm flutter run --flavor mock -t lib/main_mock.dart
fvm flutter run --flavor sit -t lib/main_sit.dart
fvm flutter run --flavor prod -t lib/main_prod.dart
```

### 📌 Deploy ด้วย Fastlane
```bash
sh deploy-prod.sh  # สำหรับ Production
sh deploy-sit.sh   # สำหรับ SIT
```

---

## ⚙️ **CI/CD & Deployment**

- **Android**: ใช้ **Firebase App Distribution** สำหรับ Testing
- **iOS**: ใช้ **TestFlight** สำหรับ Testing
- **Fastlane**: ใช้ Automate การ Deploy

---


