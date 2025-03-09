# Music Player App

## Overview

Music Player App adalah aplikasi iOS yang menampilkan daftar lagu teratas dari iTunes RSS Feed API. Aplikasi ini dikembangkan menggunakan arsitektur MVVM, memanfaatkan AVFoundation untuk memutar lagu, dan menyimpan hasil fetch lagu ke penyimpanan lokal.

![IMG_54C4540C0282-1](https://github.com/user-attachments/assets/777c7d42-bed3-43d1-a16a-4a2d499bf74a)



## Features

- Fetch daftar lagu dari iTunes RSS Feed API
- Menyimpan hasil fetch ke local storage
- Play, Pause, Next, dan Previous track menggunakan AVFoundation
- UI menggunakan SwiftUI


## Folder Structure
```sh
MusicPlayerApp/
│── Config/         # Berisi konfigurasi global seperti API endpoint, constant, dan environment setup
│── Data/           # Bertanggung jawab untuk fetching data dari API serta implementasi local storage
│── Domain/         # Berisi use case yang menghubungkan data layer dengan presentation layer
│── Model/          # Berisi struktur model data yang digunakan dalam aplikasi
│── Presentation/   # Mengelola UI, termasuk View dan ViewModel
│── Resources/      # Berisi asset seperti gambar, font
│── Service/        # Mengatur dependency seperti APIService dan AudioPlayerService
│── MusicPlayerApp.swift  # Entry point aplikasi
```


## Installation

1. Clone repository ini
```sh
   git clone https://github.com/dasuqiibrohim/TopSongs.git
   cd MusicPlayer
```
2. Buka MusicPlayer.xcodeproj di Xcode
3. Jalankan aplikasi di simulator atau perangkat fisik


## API Integration

- Menggunakan URLSession untuk fetch data dari iTunes RSS API
- Parsing data JSON menggunakan Codable
- Hasil fetch disimpan ke local storage menggunakan UserDefaults atau CoreData


## Music Player Implementation

- Menggunakan AVPlayer dari AVFoundation
- Menambahkan observer untuk progress lagu
- Implementasi fitur Next dan Previous untuk navigasi antar lagu


## Known Issues & Future Improvements

🔍 Search Feature: Belum tersedia

⚙️ CI/CD Integration: Belum diimplementasikan

🧪 Unit Testing: Belum tersedia, perlu implementasi lebih lanjut untuk testing ViewModel dan API calls
