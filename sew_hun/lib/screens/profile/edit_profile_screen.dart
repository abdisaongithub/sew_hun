import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sew_hun/models/user/edit_profile.dart';
import 'package:sew_hun/providers/auth/sign_in_provider.dart';
import 'package:sew_hun/providers/theme/theme_provider.dart';
import 'package:sew_hun/providers/user/edit_profile_provider.dart';
import 'package:sew_hun/screens/profile/profile_screen.dart';
import 'package:sew_hun/static.dart';
import 'package:validators/validators.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  static String id = 'EditProfileScreen';

  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<EditProfileScreen> {
  final ImagePicker _picker = ImagePicker();
  late final XFile? photo;
  EditProfile _editProfile = EditProfile();

  bool _saving = false;
  bool _pic = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ref.listen(
      editProfileProvider,
      (a, b) {
        WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
          final error = ref.watch(networkErrorProvider.notifier);
          if (error.state != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('An error occured'),
              ),
            );
            Fluttertoast.showToast(
              msg: 'Profile Updated',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black.withOpacity(0.8),
              textColor: Colors.white,
              fontSize: 16.0,
            );
            error.state = null;
          } else {
            Navigator.pop(context);
          }
        });
      },
    );

    var args =
        ModalRoute.of(context)!.settings.arguments as EditProfileArguments;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/img/bg.svg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
              top: defaultPadding,
              left: defaultPadding,
              right: defaultPadding,
            ),
            decoration: BoxDecoration(
                // color: Theme.of(context).custom.bgColor,
                ),
            child: ListView(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Edit Profile',
                      style: TextStyle(fontSize: 22),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.red,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).custom.searchAppBarColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            _pic = false;
                          });

                          photo = await _picker.pickImage(
                            source: ImageSource.gallery,
                          );

                          setState(() {
                            _pic = true;
                          });

                          if (photo?.path == null) {
                            setState(() {
                              _pic = false;
                            });
                          }
                        },
                        child: _pic
                            ? CircleAvatar(
                                radius: 50,
                                backgroundImage: FileImage(
                                  File(
                                    photo!.path,
                                  ),
                                ),
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  size: 60,
                                ),
                              )
                            : CircleAvatar(
                                radius: 50,
                                backgroundImage: CachedNetworkImageProvider(
                                  args.profile ?? '',
                                ),
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  size: 60,
                                ),
                              ),
                      ),
                      SizedBox(
                        width: smallPadding,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: 180,
                            child: Text(
                              args.firstName.toString(), // TODO: Use name here
                              style:
                                  Theme.of(context).custom.textStyle.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.clip,
                                      ),
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          SizedBox(
                            height: largePadding,
                          ),
                          // Text(
                          //   'email',
                          //   style: Theme.of(context).custom.textStyle.copyWith(
                          //         fontSize: 14,
                          //         fontWeight: FontWeight.bold,
                          //         overflow: TextOverflow.clip,
                          //       ),
                          // ),
                        ],
                      ),
                      SizedBox(
                        width: defaultPadding,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            if (_pic) {
                              _editProfile.photo = photo;
                            }

                            setState(() {
                              _saving = false;
                            });

                            ref
                                .read(editProfileProvider.notifier)
                                .update(profile: _editProfile);
                          } else {}
                        },
                        child: _saving
                            ? Center(
                                child: Text(
                                  '...',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                  ),
                                ),
                              )
                            : CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.save,
                                  color: Colors.black,
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).custom.searchAppBarColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ProfileEditTile(
                          label: 'First Name',
                          initialValue: args.firstName,
                          onChanged: (String? value) {
                            _editProfile.firstName = value;
                          },
                          validator: (value) {
                            if (isNull(value)) {
                              return 'Can not accept empty First Name';
                            }
                            _editProfile.firstName = value;
                            return null;
                          },
                        ),
                        WhiteDivider(),
                        ProfileEditTile(
                          label: 'Last Name',
                          initialValue: args.lastName,
                          onChanged: (String? value) {
                            _editProfile.lastName = value;
                          },
                          validator: (value) {
                            if (isNull(value)) {
                              return 'Can not accept empty Last Name';
                            }
                            _editProfile.lastName = value;
                            return null;
                          },
                        ),
                        WhiteDivider(),
                        ProfileEditTile(
                          label: 'Phone Number',
                          initialValue: args.phone,
                          inputType: TextInputType.phone,
                          onChanged: (String? value) {
                            _editProfile.phone = value;
                          },
                          validator: (value) {
                            if (isNull(value)) {
                              return 'Can not accept empty Phone Number';
                            } else if (!isNumeric(value!)) {
                              return 'Can not accept letters';
                            }
                            _editProfile.phone = value;
                            return null;
                          },
                        ),
                        WhiteDivider(),
                        ProfileEditTile(
                          label: 'Email',
                          initialValue: args.email,
                          inputType: TextInputType.emailAddress,
                          onChanged: (String? value) {
                            _editProfile.email = value;
                          },
                          validator: (value) {
                            if (isNull(value)) {
                              return 'Can not accept empty Email';
                            } else if (!isEmail(value!)) {
                              return 'Has to be a valid Email';
                            }
                            _editProfile.email = value;
                            return null;
                          },
                        ),
                        WhiteDivider(),
                        ProfileEditTile(
                          label: 'City',
                          initialValue: args.city,
                          onChanged: (String? value) {
                            _editProfile.city = value;
                          },
                          validator: (value) {
                            if (isNull(value)) {
                              return 'Can not accept empty City';
                            }
                            _editProfile.city = value;
                            return null;
                          },
                        ),
                        WhiteDivider(),
                        ProfileEditTile(
                          label: 'Sub City / Kebele',
                          initialValue: args.subCity,
                          inputAction: TextInputAction.done,
                          onChanged: (String? value) {
                            _editProfile.subCity = value;
                          },
                          validator: (value) {
                            if (isNull(value)) {
                              return 'Can not accept empty Sub-City';
                            }
                            _editProfile.subCity = value;
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EditProfileArguments {
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? email;
  final String? city;
  final String? subCity;
  final String? profile;

  EditProfileArguments({
    this.lastName,
    this.phone,
    this.city,
    this.subCity,
    this.firstName,
    this.email,
    this.profile,
  });
}

class ProfileEditTile extends StatelessWidget {
  final String label;
  final String? initialValue;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? inputType;
  final TextInputAction? inputAction;

  const ProfileEditTile({
    Key? key,
    required this.label,
    required this.onChanged,
    this.validator,
    this.initialValue,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            onChanged: onChanged,
            validator: validator,
            keyboardType: inputType,
            textInputAction: inputAction,
            decoration: InputDecoration(
              label: Text(
                label,
                style: Theme.of(context).custom.textStyle.copyWith(
                      fontSize: 12,
                    ),
              ),
              border: InputBorder.none,
            ),
            style: Theme.of(context).custom.textStyle.copyWith(
                  fontSize: 18,
                  color: Colors.black,
                ),
            initialValue: initialValue,
          ),
        ],
      ),
    );
  }
}
