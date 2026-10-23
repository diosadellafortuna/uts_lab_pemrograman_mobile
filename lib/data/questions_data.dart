import '../models/question.dart';

// Data dummy lokal (tanpa database).
const List<Question> daftarSoal = [
  Question(
    text: '2 + 5(6/3) = ?',
    options: ['21', '12', '22', '11'],
    correctIndex: 1,
  ),
  Question(
    text: 'Apa sebutan untuk hewan yang dapat menyusui ?',
    options: ['Reptil', 'Amphibi', 'Mamalia', 'Unggas'],
    correctIndex: 2,
  ),
  Question(
    text: 'Apa mata uang negara Spanyol?',
    options: ['Dollar', 'Rupiah', 'Ringgit', 'Euro'],
    correctIndex: 3,
  ),
  Question(
    text: '3, 5, 9, 15, 23, .... ',
    options: ['33', '30', '31', '32'],
    correctIndex: 0,
  ),
  Question(
    text: 'HAHAI : IAIJK = LMNOP : ....',
    options: ['OMPQK', 'QNMOP', 'MNOPQ', 'PNOQM'],
    correctIndex: 2,
  ),
  Question(
    text: 'apakah 72 jam setelah hujan pukul 12 malam akan menjadi siang yang cerah',
    options: ['Ya', 'Tidak', 'Bisa Jadi', 'Nyerah'],
    correctIndex: 1,
  ),
  Question(
    text: 'Pilihlah kata yang paling berbeda atau tidak memiliki kesamaan karakteristik dengan kata lainnya dalam kelompok ini',
    options: ['Emas', 'Besi', 'Kayu', 'Tembaga'],
    correctIndex: 2,
  ),
  Question(
    text: 'Jika anak perempuan dari saudara laki-laki ibu Anda adalah keponakan perempuan Anda, apa hubungan kekerabatan Anda dengan saudara laki-laki ibu Anda tersebut?',
    options: ['Paman', 'Kakek', 'Sepupu', 'Ayah'],
    correctIndex: 0,
  ),
];
