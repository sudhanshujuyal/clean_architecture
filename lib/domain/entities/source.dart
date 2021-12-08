import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
class Source extends Equatable
{
  final String id;
  final String name;
  const Source({required this.id,required this.name});


  @override
  // TODO: implement props
  List<Object?> get props => [id,name];

  @override
  // TODO: implement stringify
  bool? get stringify => true;
}