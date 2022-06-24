import 'package:flutter/cupertino.dart';
import 'package:flutter_doan/model/preferential.dart';
import 'package:flutter_doan/model/preferentials.dart';

import '../../utils/filestore.dart';
import '../../widgets/grid_preferential.dart';
import '../../widgets/grid_table.dart';

class PreferentialListFragment extends StatefulWidget {
  static String routeName = "/Preferential_screen";
  const PreferentialListFragment({Key? key}) : super(key: key);

  @override
  State<PreferentialListFragment> createState() =>
      _PreferentialListFragmentState();
}

class _PreferentialListFragmentState extends State<PreferentialListFragment> {
  Future<List<Preferentials>>? preferentialss;
  @override
  void initState() {
    super.initState();
    preferentialss = FirestoreUtil.getPreferentials([]);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Preferentials>>(
        future: preferentialss,
        builder: ((context, AsyncSnapshot<List<Preferentials>> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return Column(
              children: <Widget>[
                const SizedBox(height: 10.0),
                const Text(
                  "Danh sách ưu đãi",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10.0),
                GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.15),
                  ),
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    //Map preferentials = preferential[index];
                    //bool s = (preferentials['state']);
                    return GridPreferential(
                      pre: snapshot.data![index],
                      // Preferentials(
                      //     description: (preferentials['description']),
                      //     id: int.parse(preferentials['id']),
                      //     image: preferentials['image'],
                      //     nameCoupon: preferentials['nameCoupon'],
                      //     discount: double.parse(preferentials['discount']),
                      //     quantity: preferentials['quantity'],
                      //     start: DateTime.parse((preferentials['start'])),
                      //     end: DateTime.parse((preferentials['end'])),
                      //     state: s),
                    );
                  },
                ),
                const SizedBox(height: 30),
              ],
            );
          } else {
            return const Center(
              child: Text('error'),
            );
          }
        }));
    // return Column(
    //   children: <Widget>[
    //     const SizedBox(height: 10.0),
    //     const Text(
    //       "Danh sách ưu đãi",
    //       style: TextStyle(
    //         fontSize: 23,
    //         fontWeight: FontWeight.w800,
    //       ),
    //     ),
    //     const SizedBox(height: 10.0),
    //     GridView.builder(
    //       shrinkWrap: true,
    //       primary: false,
    //       physics: const NeverScrollableScrollPhysics(),
    //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 2,
    //         crossAxisSpacing: 10,
    //         mainAxisSpacing: 10,
    //         childAspectRatio: MediaQuery.of(context).size.width /
    //             (MediaQuery.of(context).size.height / 1.15),
    //       ),
    //       itemCount: preferential == null ? 0 : preferential.length,
    //       itemBuilder: (BuildContext context, int index) {
    //         Map preferentials = preferential[index];
    //         bool s = (preferentials['state']);
    //         return GridPreferential(
    //           pre: Preferentials(
    //               description: (preferentials['description']),
    //               id: int.parse(preferentials['id']),
    //               image: preferentials['image'],
    //               nameCoupon: preferentials['nameCoupon'],
    //               discount: double.parse(preferentials['discount']),
    //               quantity: preferentials['quantity'],
    //               start: DateTime.parse((preferentials['start'])),
    //               end: DateTime.parse((preferentials['end'])),
    //               state: s),
    //         );
    //       },
    //     ),
    //     const SizedBox(height: 30),
    //   ],
    // );
  }
}
