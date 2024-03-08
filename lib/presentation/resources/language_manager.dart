enum LanguageType { ENGLISH, ARAPIC }

const String ENGLISH = "en";
const String ARAPIC = "en";

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.ARAPIC:
        return ARAPIC;
    }
  }
}
