enum AmountTypes {
  pc,
  gram,
  milliliter,
}

extension AmountTypeExtensions on AmountTypes {

  String get name {
    switch (this) {
      case AmountTypes.pc:
        return 'pc.';
      case AmountTypes.gram:
        return 'gram';
      case AmountTypes.milliliter:
        return "milliliter";
    }
  }

  AmountTypes getValue(String val) {
    switch (val) {
      case "pc.":
        return AmountTypes.pc;
      case "gram":
        return AmountTypes.gram;
      case "milliliter":
        return AmountTypes.milliliter;
      default:
        return null;
    }
  }
}
