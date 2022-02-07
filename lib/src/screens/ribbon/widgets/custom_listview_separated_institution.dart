import 'package:first_project01/src/common/constants/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListViewInstitution extends StatelessWidget {
  CustomListViewInstitution({
    Key? key,
  }) : super(key: key);

  final List<String> events = [
    'Esentail Mall',
    'Mega Center',
    'Apple city Mall',
    'Esentail Mall',
    'Mega Center',
    'Apple city Mall'
  ];
  final List<String> img = [
    'images/png/esentai.png',
    'images/png/mega.png',
    'images/png/asia.png',
    'images/png/esentai.png',
    'images/png/mega.png',
    'images/png/asia.png'
  ];
  final List<String> desctiption = [
    'Первый ТРЦ сети MEGA открыт в Алматы с 2006 года.'
        ' Вторая очередь MEGA Alma-Ata введена в эксплуатацию в 2013 году.'
        ' Спустя год распахнул свои двери MEGA Park. Теперь MEGA Alma-Ata и '
        'MEGA Park — градообразующие объекты делового, финансового, '
        'научно-образовательного, культурного центра страны — Алматы. ',
    'Esentai Mall открылся в 2012 году и с тех пор уверенно держит позиции'
        ' единственного люксового молла в Центральной Азии,'
        ' который за 8 лет своего существования стал площадкой,'
        ' задающей высокие стандарты шопинга и развлечений.',
    'Asia City Mall открылся в 2008 году и с тех пор уверенно держит позиции единственного '
        'городского молла в Центральной области, который за 15 лет своего существования '
        'стал площадкой, задающей высокие стандарты шопинга и развлечений.',
    'Первый ТРЦ сети MEGA открыт в Алматы с 2006 года.'
        ' Вторая очередь MEGA Alma-Ata введена в эксплуатацию в 2013 году.'
        ' Спустя год распахнул свои двери MEGA Park. Теперь MEGA Alma-Ata и '
        'MEGA Park — градообразующие объекты делового, финансового, '
        'научно-образовательного, культурного центра страны — Алматы. ',
    'Esentai Mall открылся в 2012 году и с тех пор уверенно держит позиции'
        ' единственного люксового молла в Центральной Азии,'
        ' который за 8 лет своего существования стал площадкой,'
        ' задающей высокие стандарты шопинга и развлечений.',
    'Asia City Mall открылся в 2008 году и с тех пор уверенно держит позиции единственного '
        'городского молла в Центральной области, который за 15 лет своего существования '
        'стал площадкой, задающей высокие стандарты шопинга и развлечений.'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => Divider(),
      itemBuilder: (_, int index) {
        return Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Material(
                child: Ink.image(
                  image: AssetImage(img[index]),
                  fit: BoxFit.cover,
                  height: 150,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 11,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              events[index],
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              desctiption[index],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          )
                        ]),
                  ),
                  SizedBox(
                    width: 21,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Icon(
                      CupertinoIcons.heart,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      itemCount: events.length,
    );
  }
}
