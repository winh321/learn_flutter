abstract class Theme{
  apply();
}

class RedTheme extends Theme{
  @override
  apply() {
    // TODO: implement apply
    print("Red theme is active");
  }
}

class YellowTheme extends Theme{
  @override
  apply() {
    // TODO: implement apply
    print("YellowTheme is active");
  }
}

enum ThemeMode{
  red,yellow
}

class AllTheme{
  static Theme setTheme(ThemeMode themeMode){
    switch(themeMode){
      case ThemeMode.red : return RedTheme();
      case ThemeMode.yellow : return YellowTheme();
    }
  }
}

    Theme yellow_theme = AllTheme.setTheme(ThemeMode.yellow);
    yellow_theme.apply();
    Theme red_theme = AllTheme.setTheme(ThemeMode.red);
    red_theme.apply();
