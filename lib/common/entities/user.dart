import 'package:cloud_firestore/cloud_firestore.dart';

/// Represents the login request data that will be sent to the API.
class LoginRequestEntity {
  int? type;                // Login type (e.g., 1 for email, 2 for social login)
  String? name;             // User's name
  String? description;      // Description of the user (optional)
  String? email;            // User's email address
  String? phone;            // User's phone number
  String? avatar;           // URL of user's profile picture
  String? open_id;          // Unique identifier for the user (e.g., from Firebase or OAuth)
  int? online;              // Online status (e.g., 1 for online, 0 for offline)

  // Constructor to initialize the LoginRequestEntity with optional parameters
  LoginRequestEntity({
    this.type,
    this.name,
    this.description,
    this.email,
    this.phone,
    this.avatar,
    this.open_id,
    this.online,
  });

  // Converts the LoginRequestEntity object to JSON (Map<String, dynamic>)
  Map<String, dynamic> toJson() => {
    "type": type,
    "name": name,
    "description": description,
    "email": email,
    "phone": phone,
    "avatar": avatar,
    "open_id": open_id,
    "online": online,
  };
}

/// Represents the response from the login API.
class UserLoginResponseEntity {
  int? code;                // HTTP response code (e.g., 200 for success)
  String? msg;              // Message from the server (e.g., "Login successful")
  UserItem? data;           // Contains detailed user data after successful login

  // Constructor to initialize the response object with optional parameters
  UserLoginResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  // Factory constructor to parse JSON and create a UserLoginResponseEntity
  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: UserItem.fromJson(json["data"]),
      );
}

/// Represents the detailed user data received after login.
class UserItem {
  String? access_token;     // Access token for authenticated requests
  String? token;            // Another token, possibly for refresh or secondary use
  String? name;             // User's name
  String? description;      // Description of the user (optional)
  String? avatar;           // URL to the user's avatar/profile picture
  int? online;              // User's online status
  int? type;                // Type of user (e.g., admin, regular user)

  // Constructor to initialize the UserItem with optional parameters
  UserItem({
    this.access_token,
    this.token,
    this.name,
    this.description,
    this.avatar,
    this.online,
    this.type,
  });

  // Factory constructor to parse JSON and create a UserItem
  factory UserItem.fromJson(Map<String, dynamic> json) =>
      UserItem(
        access_token: json["access_token"],
        token: json["token"],
        name: json["name"],
        description: json["description"],
        avatar: json["avatar"],
        online: json["online"],
        type: json["type"],
      );

  // Converts the UserItem object to JSON (Map<String, dynamic>)
  Map<String, dynamic> toJson() => {
    "access_token": access_token,
    "token": token,
    "name": name,
    "description": description,
    "avatar": avatar,
    "online": online,
    "type": type,
  };
}

/// Represents user data stored and retrieved from Firestore.
class UserData {
  final String? token;      // Token for user authentication
  final String? name;       // User's name
  final String? avatar;     // URL to the user's avatar/profile picture
  final String? description;// User's description (optional)
  final int? online;        // User's online status

  // Constructor to initialize UserData with optional parameters
  UserData({
    this.token,
    this.name,
    this.avatar,
    this.description,
    this.online,
  });

  // Factory constructor to convert Firestore DocumentSnapshot into UserData
  factory UserData.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return UserData(
      token: data?['token'],
      name: data?['name'],
      avatar: data?['avatar'],
      description: data?['description'],
      online: data?['online'],
    );
  }

  // Converts the UserData object to a Map for storing in Firestore
  Map<String, dynamic> toFirestore() {
    return {
      if (token != null) "token": token,
      if (name != null) "name": name,
      if (avatar != null) "avatar": avatar,
      if (description != null) "description": description,
      if (online != null) "online": online,
    };
  }
}
