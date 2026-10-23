# Kuis Flutter

## Identitas Mahasiswa
- Nama : (isi namamu)
- NIM  : (isi NIM)
- Lab  : Pemrograman Mobile (PM 5)

## Informasi Aplikasi
**Nama Aplikasi:** Kuis Flutter

**Deskripsi:** Aplikasi kuis pilihan ganda tentang dasar Flutter. Pengguna memasukkan nama, menjawab 8 soal, lalu melihat skor akhir dan review jawaban.

**Fitur:**
- Input nama dengan validasi
- 8 soal pilihan ganda, bisa maju/mundur
- Progress bar & penyimpanan jawaban dengan Provider (aman saat rotasi layar)
- Skor akhir, nilai, dan review jawaban benar/salah
- Riwayat skor selama aplikasi berjalan
- Dark mode / Light mode (bonus)
- Layout adaptif untuk tablet / web (bonus)

## Dokumentasi
**Credit aset:**
- Font Poppins — Indian Type Foundry (SIL Open Font License), via Google Fonts
- Logo — dibuat sendiri
- Ikon — Material Icons

**Screenshot:** (tambahkan screenshot tiap halaman di folder `screenshots/`)

**Mockup/Prototype:** (tempel link Figma di sini)

## Struktur Proyek
```
lib/
  main.dart
  data/        -> data soal dummy
  models/      -> class Question, ScoreEntry
  providers/   -> QuizProvider, ThemeProvider
  screens/     -> home, quiz, result
  utils/       -> helper ukuran responsif
  widgets/     -> widget reusable
```
