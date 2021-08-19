class WarningMessage {
  String? _title;
  String? _content;
  WarningMessage(this._title, this._content);


  String get title => _title!;

  set title(String value) {
    _title = value;
  }

  Map<String, dynamic> toMap() {

    Map<String, dynamic> map = {
      'title': _title,
      'content': _content
    };
    return map;
  }

  String get content => _content!;

  set content(String value) {
    _content = value;
  }
}
