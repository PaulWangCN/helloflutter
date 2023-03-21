import 'package:flutter/material.dart';
import 'package:helloflutter/github_trending_list.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: http.get(Uri.parse('https://github.com/trending')),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //判断有没有值
            http.Response? response = snapshot.data;
            if (response == null) {
              return const Center(
                child: Text('从github获取trending数据失败！'),
              );
            }
            if (response.statusCode == 200) {
              dom.Document document = parser.parse(response.body);
              List<dom.Element> elementsByClassName =
                  document.getElementsByClassName('Box-row');
              List<GithubTrending> list = [];
              for (dom.Element element in elementsByClassName) {
                dom.Element titleEle =
                    element.getElementsByClassName('h3 lh-condensed')[0];
                String name = titleEle.text.trim();
                dom.Element? subtitleEle = titleEle.nextElementSibling;
                String prefix = name.split('/')[0].trim();
                String suffix = name.split('/')[1].trim();
                String title = "$prefix / $suffix";
                String subtitle = '';
                if (subtitleEle != null &&
                    subtitleEle.className == 'col-9 color-fg-muted my-1 pr-4') {
                  subtitle = subtitleEle.text.trim();
                }
                GithubTrending trending = GithubTrending(
                  title: title,
                  subtitle: subtitle,
                );
                list.add(trending);
              }
              return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final String title = (list)[index].title;
                    final String subtitle = (list)[index].subtitle;
                    return ListTile(
                      title: Text(title),
                      subtitle: Text(subtitle),
                    );
                  },
              );
            } else {
              return const Center(
                child: Text('错误响应值'),
              );
            }
          } else {
            return const Center(
              child: SizedBox(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.blue,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
