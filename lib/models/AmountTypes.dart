enum AmountTypes {
  pc,
  gram,
  mililiter,
}

extension AmountTypeExtensions on AmountTypes {
  String get name {
    switch (this) {
      case AmountTypes.pc:
        return 'pc.';
      case AmountTypes.gram:
        return 'gram';
      case AmountTypes.mililiter:
        return "mililiter";
    }
  }

  AmountTypes getValue(String val) {
    switch (val) {
      case "pc.":
        return AmountTypes.pc;
      case "gram":
        return AmountTypes.gram;
      case "mililiter":
        return AmountTypes.mililiter;
      default:
        return null;
    }
  }
}
