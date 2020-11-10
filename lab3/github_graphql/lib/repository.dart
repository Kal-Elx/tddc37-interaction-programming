import 'package:flutter/material.dart';

class Repository {
  final String name;
  final String nameWithOwner;
  final String description;
  final int stars;
  final int forks;
  final String license;
  final int commits;
  final int branches;

  Repository({
    @required this.name,
    @required this.nameWithOwner,
    @required this.description,
    @required this.stars,
    @required this.forks,
    @required this.license,
    @required this.commits,
    @required this.branches,
  });
}
