import 'package:reflectable/reflectable.dart';

class Reflector extends Reflectable {
  const Reflector() : super();
}

const reflector = Reflector();

@reflector
class DynamicUser {
  final Map<String, dynamic> data;

  DynamicUser(this.data);

  factory DynamicUser.fromJson(Map<String, dynamic> json) {
    return DynamicUser(json);
  }

  Map<String, dynamic> toJson() {
    return data;
  }
}
