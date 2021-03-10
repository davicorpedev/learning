import 'package:flutter/material.dart';
import 'package:learning_app/presentation/internalization_common.dart';

class InternalizationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.hello),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.screenText,
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            Text(
              AppLocalizations.of(context)!.tryYourself(getLocale(context)),
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  String getLocale(BuildContext context) {
    if (AppLocalizations.of(context)!.localeName == "en") {
      return "Spanish";
    } else {
      return "Inglés";
    }
  }
}
