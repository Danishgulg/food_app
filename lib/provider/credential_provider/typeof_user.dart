import 'package:food_app/data/enum/user_type_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final typeOfUser = StateProvider<UserTypeEnum>((ref) => UserTypeEnum.manager);