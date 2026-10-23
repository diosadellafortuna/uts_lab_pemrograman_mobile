import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../providers/theme_provider.dart';
import '../utils/responsive.dart';
import '../widgets/content_wrapper.dart';
import '../widgets/primary_button.dart';
import 'quiz_screen.dart';

/// Halaman 1: input nama pengguna.
/// StatefulWidget karena memegang TextEditingController dan form key.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    // Isi dengan nama yang sudah tersimpan (jika ada)
    _nameController =
        TextEditingController(text: context.read<QuizProvider>().userName);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _mulai() {
    if (!_formKey.currentState!.validate()) return;
    final quiz = context.read<QuizProvider>();
    quiz.setName(_nameController.text);
    quiz.restart();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const QuizScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    final history = context.watch<QuizProvider>().history;
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            tooltip: 'Ganti tema',
            icon: Icon(theme.isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: theme.toggle,
          ),
        ],
      ),
      body: ContentWrapper(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: context.hp(18),
              ),
              SizedBox(height: context.sp(16)),
              Text(
                'Kuis Kepintaran',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: context.sp(30),
                  fontWeight: FontWeight.w700,
                  color: cs.primary,
                ),
              ),
              SizedBox(height: context.sp(6)),
              Text(
                'Uji seberapa pintar dirimu sendiri!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: context.sp(14)),
              ),
              SizedBox(height: context.sp(28)),
              TextFormField(
                controller: _nameController,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) => _mulai(),
                style: TextStyle(fontSize: context.sp(15)),
                decoration: InputDecoration(
                  labelText: 'Nama kamu',
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(context.sp(14)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  if (value.trim().length < 2) {
                    return 'Nama minimal 2 karakter';
                  }
                  return null;
                },
              ),
              SizedBox(height: context.sp(20)),
              PrimaryButton(
                label: 'Mulai Kuis',
                icon: Icons.play_arrow_rounded,
                onPressed: _mulai,
              ),
              if (history.isNotEmpty) ...[
                SizedBox(height: context.sp(28)),
                Text(
                  'Riwayat Skor',
                  style: TextStyle(
                    fontSize: context.sp(16),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: context.sp(8)),
                for (final h in history)
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.emoji_events_outlined),
                      title: Text(h.name,
                          style: TextStyle(fontSize: context.sp(14))),
                      trailing: Text(
                        '${h.score}/${h.total}',
                        style: TextStyle(
                          fontSize: context.sp(15),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
