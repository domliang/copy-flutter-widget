import 'package:flutter/services.dart';

/*
 * https://dev.to/rubensdemelo/flutter-formatting-textfield-with-textinputformatter-1oii
 *
**/

class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = StringBuffer();
    // if (newTextLength >= 1) {
    //   // newText.write('(');
    //   if (newValue.selection.end >= 1) selectionIndex++;
    // }
    // if (newTextLength >= 4) {
    //   // newText.write(newValue.text.substring(0, usedSubstringIndex = 3) + ') ');
    //   if (newValue.selection.end >= 3) selectionIndex += 2;
    // }
    if (newTextLength >= 4) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 3) + '-');
      if (newValue.selection.end >= 3) selectionIndex++;
    }
    if (newTextLength >= 8) {
      newText.write(newValue.text.substring(3, usedSubstringIndex = 7) + '-');
      if (newValue.selection.end >= 7) selectionIndex++;
    }
    if (newTextLength >= usedSubstringIndex)
      newText.write(newValue.text.substring(usedSubstringIndex));
    return newValue.copyWith(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
