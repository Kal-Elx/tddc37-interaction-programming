import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'repository.dart';
import 'repository_list.dart';
import 'language_selector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final token = '013aa244e4afb4e22cdfb2adaa7d4622c3bd1927';

  final HttpLink httpLink = HttpLink(
    uri: 'https://api.github.com/graphql',
  );

  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer $token',
    // OR
    // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  );

  final Link link = authLink.concat(httpLink);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: link,
    ),
  );

  runApp(MyApp(client: client));
}

class MyApp extends StatefulWidget {
  final ValueNotifier<GraphQLClient> client;

  const MyApp({Key key, this.client}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var language = 'Top overall';
  @override
  Widget build(BuildContext context) {
    final String languageQuery =
        language == 'Top overall' ? '' : ' language:$language';
    final String _query = """
    {
      search(query: "is:public stars:>0$languageQuery", type: REPOSITORY, first: 20) {
        edges {
          node {
            ... on Repository {
              name
              nameWithOwner
              description
              stargazerCount
              forkCount
              licenseInfo {
                name
              }
              main: object(expression: "main") {
                ... on Commit {
                  history {
                    totalCount
                  }
                }
              }
              master: object(expression: "master") {
                ... on Commit {
                  history {
                    totalCount
                  }
                }
              }
              branches: refs(first: 0, refPrefix: "refs/heads/") {
                totalCount
              }
            }
          }
        }
      }
    }
    """;

    return GraphQLProvider(
      client: widget.client,
      child: CacheProvider(
        child: MaterialApp(
          title: 'GitHub GraphQL',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Scaffold(
            floatingActionButton: LanguageSelector((String newLanguage) {
              setState(() {
                this.language = newLanguage;
              });
            }),
            body: Query(
              options: QueryOptions(
                documentNode: gql(_query),
              ),
              builder: (
                res, {
                VoidCallback refetch,
                FetchMore fetchMore,
              }) {
                if (res.data != null) {
                  var elems = res.data['search']['edges'];
                  final repos = List.generate(elems.length, (i) {
                    final elem = elems[i]['node'];
                    final branch = elem['master'] != null
                        ? 'master'
                        : elem['main'] != null
                            ? 'main'
                            : null;
                    return Repository(
                      name: elem['name'],
                      nameWithOwner: elem['nameWithOwner'],
                      description: elem['description'] != null
                          ? elem['description']
                          : "",
                      stars: elem['stargazerCount'],
                      forks: elem['forkCount'],
                      license: elem['licenseInfo'] != null
                          ? elem['licenseInfo']['name']
                          : "No license",
                      commits: branch != null
                          ? elem[branch]['history']['totalCount']
                          : 0,
                      branches: elem['branches']['totalCount'],
                    );
                  });

                  return RepositoryList(repos);
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }
}
