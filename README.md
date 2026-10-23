## Identitas Mahasiswa
- Nama : Dewi Fortuna Halim
- NIM  : 241401066
- Lab  : Pemrograman Mobile (PM 5)

## Informasi Aplikasi
**Nama Aplikasi:** Kuis Kepintaran

**Deskripsi:** Aplikasi kuis pilihan ganda tentang dasar" pengetahuan umum. Pengguna memasukkan nama, menjawab 8 soal, lalu melihat skor akhir dan review jawaban.

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

**Screenshot:** di folder screenshot

**Mockup/Prototype:** https://www.figma.com/design/kOVNQKr6D97xllaIcdyAcB/Untitled?node-id=0-1&t=l6gn8HqzAynx7TgG-1

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
