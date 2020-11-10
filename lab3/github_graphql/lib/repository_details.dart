import 'package:flutter/material.dart';
import 'package:github_graphql/repository.dart';

class RepositoryDetails extends StatelessWidget {
  final Repository repo;

  RepositoryDetails(this.repo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              repo.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(repo.description),
          SizedBox(height: 12),
          Text('License: ${repo.license}'),
          SizedBox(height: 12),
          Text('Commits: ${repo.commits.toString()}'),
          SizedBox(height: 12),
          Text('Branches: ${repo.branches.toString()}'),
        ],
      ),
    );
  }
}
