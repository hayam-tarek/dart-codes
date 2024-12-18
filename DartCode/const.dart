main() {
  const User u1 = User(id: 1827119, name: 'hayam');
  const User u2 = User.anonymous();
  print('User id : ${u1.id}, Name : ${u1.name}');
  print('User id : ${u2.id}, Name : ${u2.name}');
  User u3 = u1.makeCopy();
  User u4 = u1;
  print(u1 == u3);
  print(u1 == u4);
  print(u3.id);
  print(u3.name);
  final hayam = Email(address: 'hayam@gmail.com');
  final emailString = hayam.email; //getter
  print(emailString);
  Password pass = Password(value: 'hayam145278@#');
  pass.password = '123456789'; // setter
  print(pass.password); // getter
}

/**
 * classes mutable
 */
class Password {
  String _value;
  Password({required String value}) : _value = value;
  String get password => _value;
  set password(String value) => _value = value; //مش فاينل value طلما ال
}

/**
 * classes immutable
 */
class Email {
  final String _address;
  const Email({required String address}) : _address = address;
  String get email => _address;
}

class User {
  const User({int id = 0, String name = 'anonymous'})
      : assert(id >= 0),
        _id = id,
        _name = name;
  const User.anonymous() : this();
  final String _name;
  final int _id;
  User makeCopy() {
    return User(id: this._id, name: this._name);
  }

  int get id => _id;
  String get name => _name;
// ...
}
