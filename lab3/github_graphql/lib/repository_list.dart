import 'package:flutter/material.dart';

import 'repository.dart';
import 'repository_item.dart';

class RepositoryList extends StatelessWidget {
  final List<Repository> repos;

  RepositoryList(this.repos);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, i) => RepositoryItem(repos[i]),
      itemCount: repos.length,
    );
  }
}
