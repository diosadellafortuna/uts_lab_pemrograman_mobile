<img width="960" height="600" alt="Screenshot 2026-10-24 010454" src="https://github.com/user-attachments/assets/7291a817-61e3-410c-a10f-870d73a96f11" /># Kuis Flutter

## Identitas Mahasiswa
- Nama : Dewi Fortuna Halim
- NIM  : 241401066
- Lab  : Pemrograman Mobile (PM 5)

## Informasi Aplikasi
**Nama Aplikasi:** Kuis Flutter

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

**Screenshot:** <img width="960" height="600" alt="Screenshot 2026-10-24 010642" src="https://github.com/user-attachments/assets/3e8ca7f3-72b2-4af8-b0b5-86f18b898581" />
<img width="960" height="600" alt="Screenshot 2026-10-24 010633" src="https://github.com/user-attachments/assets/66a521ff-cbb9-48ef-932b-ef9ee609289e" />
<img width="960" height="600" alt="Screenshot 2026-10-24 010627" src="https://github.com/user-attachments/assets/ec10ea95-9816-4d8e-825a-4d21e5fe260f" />
<img width="960" height="600" alt="Screenshot 2026-10-24 010621" src="https://github.com/user-attachments/assets/4f65ee8b-1389-4fd4-a542-c868446c75a4" />
<img width="960" height="600" alt="Screenshot 2026-10-24 010614" src="https://github.com/user-attachments/assets/99176603-0864-4c28-8e3e-cd119f90b924" />
<img width="960" height="600" alt="Screenshot 2026-10-24 010606" src="https://github.com/user-attachments/assets/8a3207a0-af1c-48da-93bd-fb575f99ddc4" />
<img width="960" height="600" alt="Screenshot 2026-10-24 010600" src="https://github.com/user-attachments/assets/4898da9d-4747-470c-9000-8dc15cd4c217" />
<img width="960" height="600" alt="Screenshot 2026-10-24 010554" src="https://github.com/user-attachments/assets/771d17d9-3665-4b76-9e3f-a072bbdf6217" />
<img width="960" height="600" alt="Screenshot 2026-10-24 010545" src="https://github.com/user-attachments/assets/eb87db5e-45f1-4dab-a360-abeea02a49d7" />
<img width="960" height="600" alt="Screenshot 2026-10-24 010539" src="https://github.com/user-attachments/assets/4f988d90-0d9c-4fac-9ede-a8902fdfa388" />
<img width="960" height="600" alt="Screenshot 2026-10-24 010530" src="https://github.com/user-attachments/assets/e4bbe2a8-82ce-4db8-8920-7f55b4dc3ade" />



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
