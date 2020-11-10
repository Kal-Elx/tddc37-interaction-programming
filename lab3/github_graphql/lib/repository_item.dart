import 'package:flutter/material.dart';
import 'package:github_graphql/star_count.dart';

import 'repository.dart';
import 'repository_details.dart';

class RepositoryItem extends StatelessWidget {
  final Repository repo;

  RepositoryItem(this.repo);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(repo.nameWithOwner),
      subtitle: Text(repo.description),
      leading: StarCount(repo.stars),
      trailing: Text('${repo.forks.toString()} forks'),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RepositoryDetails(repo),
        ),
      ),
    );
  }
}
