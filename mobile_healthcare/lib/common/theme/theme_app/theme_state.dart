import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class InitialThemeState extends ThemeState {}

class LoadedThemeState extends ThemeState {
  final ThemeData themeData;

  const LoadedThemeState({@required this.themeData})
      : assert(themeData != null, "");

  @override
  // TODO: implement props
  List<Object> get props => [themeData];
}

class ErrorThemeState extends ThemeState {}
