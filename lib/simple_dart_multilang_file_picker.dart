import 'dart:html';

import 'package:simple_dart_multilang_controller/simple_dart_multilang_controller.dart';
import 'package:simple_dart_ui_core/simple_dart_ui_core.dart';

class MultilangFilePicker extends Component {
  MultilangFilePicker() : super('FilePicker');

  final FileUploadInputElement _fileUploadInputElement = FileUploadInputElement();

  @override
  Element get element => _fileUploadInputElement;

  File getCurrentFile() => _fileUploadInputElement.files!.first;

  String get caption => _fileUploadInputElement.title ?? '';

  set caption(String newVal) => _fileUploadInputElement.title = newVal;

  String _langKey = '';

  set langKey(String value) {
    _langKey = value;
    reRender();
  }

  String get langKey => _langKey;

  @override
  void reRender() {
    if (_langKey.isEmpty) {
      caption = _langKey;
    } else {
      _fileUploadInputElement.lang = multilangController.getLangCode(multilangController.lang);
      caption = multilangController.translate(_langKey);
    }
  }
}
