import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/l10n.dart';
import '../provider/locale_provider.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final flag = L10n.getFlag(locale.languageCode);

    return Center(
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 72,
        child: Text(
          flag,
          style: const TextStyle(fontSize: 80),
        ),
      ),
    );
  }
}

class LanguagePickerWidget extends StatefulWidget {
  const LanguagePickerWidget({super.key});

  @override
  State<LanguagePickerWidget> createState() => _LanguagePickerWidgetState();
}

class _LanguagePickerWidgetState extends State<LanguagePickerWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    final locale = provider.locale;

    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: locale,
        icon: const SizedBox(
          width: 8,
          height: 8,
        ),
        items: L10n.all.map(
          (locale) {
            final flag = L10n.getFlag(locale.languageCode);
            return DropdownMenuItem(
              value: locale,
              onTap: () {
                final provider =
                    Provider.of<LocaleProvider>(context, listen: false);

                provider.setLocale(locale);
                print(locale);
              },
              child: Center(
                child: Text(
                  flag,
                  style: const TextStyle(fontSize: 32),
                ),
              ),
            );
          },
        ).toList(),
        onChanged: (_) {},
      ),
    );
  }
}
