import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/progress_provider.dart';
import '../../providers/settings_provider.dart';
import '../../providers/course_provider.dart';
import '../../utils/constants.dart';
import '../../utils/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsProvider>();
    final progressProvider = context.watch<ProgressProvider>();
    final courseProvider = context.watch<CourseProvider>();
    final lang = settings.language;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                AppStrings.get('profile', lang),
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(height: 24),

              // Profile Card
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: AppTheme.primaryGradient,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryColor.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person_rounded,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lang == 'kh' ? 'អ្នកសិក្សា' : 'Learner',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            lang == 'kh'
                                ? 'បន្តរៀនសូត្រ!'
                                : 'Keep learning!',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Stats Section
              Text(
                AppStrings.get('my_progress', lang),
                style: Theme.of(context).textTheme.headlineSmall,
              ),

              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      context,
                      Icons.menu_book_rounded,
                      '${courseProvider.courses.length}',
                      lang == 'kh' ? 'វគ្គសិក្សា' : 'Courses',
                      AppTheme.primaryColor,
                      settings,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildStatCard(
                      context,
                      Icons.check_circle_rounded,
                      '${progressProvider.totalCompletedLessons}',
                      AppStrings.get('lessons_completed', lang),
                      AppTheme.successColor,
                      settings,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildStatCard(
                      context,
                      Icons.quiz_rounded,
                      '${progressProvider.totalQuizzesTaken}',
                      AppStrings.get('quizzes_taken', lang),
                      AppTheme.secondaryColor,
                      settings,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Settings Section
              Text(
                AppStrings.get('settings', lang),
                style: Theme.of(context).textTheme.headlineSmall,
              ),

              const SizedBox(height: 16),

              // Language Setting
              _buildSettingTile(
                context,
                Icons.language_rounded,
                AppStrings.get('language', lang),
                lang == 'kh' ? 'ខ្មែរ' : 'English',
                settings,
                onTap: () => _showLanguageDialog(context, settings),
              ),

              // Dark Mode Setting
              _buildSettingTile(
                context,
                Icons.dark_mode_rounded,
                AppStrings.get('dark_mode', lang),
                null,
                settings,
                trailing: Switch(
                  value: settings.isDarkMode,
                  onChanged: (value) => settings.setDarkMode(value),
                  activeColor: AppTheme.primaryColor,
                ),
              ),

              // Reset Progress
              _buildSettingTile(
                context,
                Icons.refresh_rounded,
                AppStrings.get('reset_progress', lang),
                null,
                settings,
                iconColor: AppTheme.errorColor,
                onTap: () => _showResetDialog(context, settings, progressProvider),
              ),

              const SizedBox(height: 32),

              // About Section
              Text(
                AppStrings.get('about', lang),
                style: Theme.of(context).textTheme.headlineSmall,
              ),

              const SizedBox(height: 16),

              _buildSettingTile(
                context,
                Icons.info_outline_rounded,
                'LearnHub',
                '${AppStrings.get('version', lang)} 1.0.0',
                settings,
              ),

              const SizedBox(height: 40),

              // Footer
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        Icons.school_rounded,
                        color: AppTheme.primaryColor,
                        size: 30,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'LearnHub',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      lang == 'kh'
                          ? 'រៀនគ្រប់ទីកន្លែង គ្រប់ពេលវេលា'
                          : 'Learn Anywhere, Anytime',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    IconData icon,
    String value,
    String label,
    Color color,
    SettingsProvider settings,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: settings.isDarkMode ? AppTheme.darkCard : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: settings.isDarkMode ? Colors.white : AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color:
                  settings.isDarkMode ? Colors.white54 : AppTheme.textSecondary,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildSettingTile(
    BuildContext context,
    IconData icon,
    String title,
    String? subtitle,
    SettingsProvider settings, {
    Widget? trailing,
    Color? iconColor,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: settings.isDarkMode ? AppTheme.darkCard : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: (iconColor ?? AppTheme.primaryColor).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: iconColor ?? AppTheme.primaryColor,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: settings.isDarkMode ? Colors.white : AppTheme.textPrimary,
          ),
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle,
                style: TextStyle(
                  color: settings.isDarkMode
                      ? Colors.white54
                      : AppTheme.textSecondary,
                ),
              )
            : null,
        trailing: trailing ??
            (onTap != null
                ? Icon(
                    Icons.chevron_right_rounded,
                    color: settings.isDarkMode
                        ? Colors.white54
                        : AppTheme.textLight,
                  )
                : null),
        onTap: onTap,
      ),
    );
  }

  void _showLanguageDialog(BuildContext context, SettingsProvider settings) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(AppStrings.get('language', settings.language)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Text('🇺🇸', style: TextStyle(fontSize: 24)),
              title: const Text('English'),
              trailing: settings.language == 'en'
                  ? const Icon(Icons.check_circle, color: AppTheme.primaryColor)
                  : null,
              onTap: () {
                settings.setLanguage('en');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Text('🇰🇭', style: TextStyle(fontSize: 24)),
              title: const Text('ខ្មែរ'),
              trailing: settings.language == 'kh'
                  ? const Icon(Icons.check_circle, color: AppTheme.primaryColor)
                  : null,
              onTap: () {
                settings.setLanguage('kh');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showResetDialog(BuildContext context, SettingsProvider settings,
      ProgressProvider progressProvider) {
    final lang = settings.language;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(AppStrings.get('reset_progress', lang)),
        content: Text(AppStrings.get('confirm_reset', lang)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppStrings.get('cancel', lang)),
          ),
          ElevatedButton(
            onPressed: () {
              progressProvider.resetProgress();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    lang == 'kh'
                        ? 'វឌ្ឍនភាពត្រូវបានកំណត់ឡើងវិញ'
                        : 'Progress has been reset',
                  ),
                  backgroundColor: AppTheme.successColor,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.errorColor,
            ),
            child: Text(AppStrings.get('confirm', lang)),
          ),
        ],
      ),
    );
  }
}
