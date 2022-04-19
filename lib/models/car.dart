import 'package:flutter/cupertino.dart';

class Car {
  final String Id;
  final String Name;
  final String Rent;
  final String Thumbnail;
  final String Image;
  final int ThemeColor;
  final bool IsStarred;

  Car(this.Id, this.Name, this.Rent, this.Thumbnail, this.Image,
      this.ThemeColor, this.IsStarred);

  Car CopyWith({bool? isStarred}) {
    return Car(this.Id, this.Name, this.Rent, this.Thumbnail, this.Image,
        this.ThemeColor, isStarred ?? this.IsStarred);
  }
}
