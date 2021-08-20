class WarningMessage {
  String? _title;
  String? _content;
  WarningMessage();
  WarningMessage.instance(this._title, this._content);

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

  WarningMessage fromJson(Map<String, dynamic> elem) {
    this.title = elem['title'];
    this.content = elem['content'];
    return this;
  }

  String get content => _content!;

  set content(String value) {
    _content = value;
  }
}
