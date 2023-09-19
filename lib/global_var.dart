import 'package:boxing/models/user_model.dart';
import 'package:get_storage/get_storage.dart';

GetStorage locator = GetStorage();
///TODO: set getIt
///sharedPreferencesVariables/GetStorage
String forProfile= "profilePicture";
String forId= "userId";
String forUsername= "username";
String forEmail= "email";


// Future<UserModel?> getUserData(String uid) async {
//   try {
//     DocumentSnapshot userSnapshot =
//     await FirebaseFirestore.instance.collection('users').doc(uid).get();
//
//     if (userSnapshot.exists) {
//       Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;
//       return UserModel(
//         id: userData['uid'],
//         email: userData['email'],
//         firstName: userData['firstName'],
//         lastName: userData['lastName'],
//         phone: userData['phone'],
//       );
//     }
//   } catch (e) {
//     print('Error fetching user data: $e');
//   }
//   return null; // Return null if user data couldn't be fetched
// }
