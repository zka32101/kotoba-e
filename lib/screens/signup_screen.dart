import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoba_e/config/theme.dart';
import 'package:kotoba_e/providers/auth_provider.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _userType = 'domestic';
  int _gradeLevel = 3;
  bool _loading = false;
  String? _error;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignup() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() { _loading = true; _error = null; });
    try {
      await ref.read(currentUserProvider.notifier).signup(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        displayName: _nameController.text.trim(),
        userType: _userType,
        gradeLevel: _gradeLevel,
      );
      if (mounted) context.go('/home');
    } catch (e) {
      setState(() => _error = _mapError(e));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  String _mapError(Object e) {
    final msg = e.toString();
    if (msg.contains('email-already-in-use')) return 'このメールアドレスは既に使用されています';
    if (msg.contains('weak-password')) return 'パスワードは6文字以上にしてください';
    if (msg.contains('firebase') || msg.contains('PlatformException')) {
      return 'Firebase 未設定のため登録できません。ゲストとして利用してください。';
    }
    return '登録に失敗しました';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('新規登録'), elevation: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_error != null) ...[
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppTheme.error.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppTheme.error.withValues(alpha: 0.3)),
                    ),
                    child: Text(_error!, style: const TextStyle(color: AppTheme.error, fontSize: 13)),
                  ),
                  const SizedBox(height: 16),
                ],

                // ── 名前 ──
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: '名前（ニックネーム）',
                    prefixIcon: const Icon(Icons.person_outline),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  validator: (v) => (v?.isEmpty ?? true) ? '名前を入力してください' : null,
                ),
                const SizedBox(height: 16),

                // ── メール ──
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'メールアドレス',
                    prefixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  validator: (v) => (v?.isEmpty ?? true) ? 'メールを入力してください' : null,
                ),
                const SizedBox(height: 16),

                // ── パスワード ──
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'パスワード（6文字以上）',
                    prefixIcon: const Icon(Icons.lock_outlined),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  validator: (v) => (v?.length ?? 0) < 6 ? '6文字以上のパスワードを入力してください' : null,
                ),
                const SizedBox(height: 24),

                // ── ユーザータイプ ──
                const Text('ユーザータイプ', style: AppTheme.heading3),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: _TypeCard(
                        label: '国内向け',
                        sublabel: '小学生・日本語話者',
                        icon: '🇯🇵',
                        selected: _userType == 'domestic',
                        onTap: () => setState(() => _userType = 'domestic'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _TypeCard(
                        label: 'グローバル',
                        sublabel: '海外日本語学習者',
                        icon: '🌍',
                        selected: _userType == 'global',
                        onTap: () => setState(() => _userType = 'global'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // ── 学年 ──
                Row(
                  children: [
                    Text('学年 / レベル', style: AppTheme.heading3),
                    const SizedBox(width: 12),
                    Text('$_gradeLevel年生', style: const TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
                Slider(
                  value: _gradeLevel.toDouble(),
                  min: 1, max: 6, divisions: 5,
                  label: '$_gradeLevel年生',
                  onChanged: (v) => setState(() => _gradeLevel = v.toInt()),
                ),
                const SizedBox(height: 24),

                // ── 登録ボタン ──
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: _loading ? null : _handleSignup,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: _loading
                        ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                        : const Text('登録する', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('既にアカウントがある？'),
                    TextButton(
                      onPressed: () => context.go('/login'),
                      child: const Text('ログイン'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TypeCard extends StatelessWidget {
  final String label, sublabel, icon;
  final bool selected;
  final VoidCallback onTap;

  const _TypeCard({required this.label, required this.sublabel, required this.icon, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: selected ? AppTheme.primary.withValues(alpha: 0.1) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: selected ? AppTheme.primary : AppTheme.divider, width: selected ? 2 : 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(icon, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 6),
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            Text(sublabel, style: AppTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
