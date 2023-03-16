import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:users_pattern_bloc/model/user_model.dart';
import 'package:users_pattern_bloc/views/item_of_user.dart';

Widget viewOfHome(List<User> items, bool isLoading) {
  return Stack(
    children: [
      ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, index) {
          return itemOfUser(ctx, items[index]);
        },
      ),
      isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : const SizedBox.shrink(),
    ],
  );
}
