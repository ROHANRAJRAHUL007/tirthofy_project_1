import 'package:firebase_auth/firebase_auth.dart';
import 'package:tirthofy_code_1/features/home/presentation/pages/user_model.dart';

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

User? currentUsser;

UserModel? userModelCurrentInfo;
