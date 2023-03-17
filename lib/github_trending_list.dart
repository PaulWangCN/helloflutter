import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

// class GithubTrendingList {
//   List<GithubTrending> list;
//   bool success;
//   String msg;
//
//   GithubTrendingList({
//     required this.list,
//     required this.success,
//     required this.msg,
//   });
//
//   List<GithubTrending> fromHtml(bool success,String html) {
//     List<GithubTrending> rows = [];
//     dom.Document document = parser.parse(html);
//     List<dom.Element> elementsByClassName = document.getElementsByClassName('Box-row');
//     for (dom.Element element in elementsByClassName) {
//       String name = element.getElementsByClassName('h3 lh-condensed')[0].text.trim();
//       String prefix = name.split('/')[0].trim();
//       String suffix = name.split('/')[1].trim();
//       rows.add(GithubTrending(name: prefix + " / " + suffix));
//     }
//     return rows;
//   }
// }

class GithubTrending {
  // final String language;
  // final String url;
  // final int star;
  // final int fork;
  // final int starToday;
  final String title;
  final String subtitle;

  GithubTrending({
    required this.title,
    required this.subtitle,
  });

}
