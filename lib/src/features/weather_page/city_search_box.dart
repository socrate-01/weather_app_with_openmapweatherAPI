import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather_example_flutter/src/constants/app_colors.dart';
import 'package:open_weather_example_flutter/src/features/weather_page/weather_page2.dart';

//import 'city_search_box_all.dart';

final cityProvider = StateProvider<String>((ref) {
  return 'Dakar';
});
final cityProvider1 = StateProvider<String>((ref) {
  return 'Abidjan';
});
final cityProvider2 = StateProvider<String>((ref) {
  return 'London';
});
final cityProvider3 = StateProvider<String>((ref) {
  return 'Dakar';
});


class CitySearchBox extends ConsumerStatefulWidget {
  const CitySearchBox({Key? key}) : super(key: key);
  @override
  ConsumerState<CitySearchBox> createState() => _CitySearchRowState();
}

class _CitySearchRowState extends ConsumerState<CitySearchBox> {
  static const _radius = 30.0;

  late final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.text = ref.read(cityProvider);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // circular radius
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /*Expanded(
            child: SizedBox(
              height: 50,
              child: TextField(
                controller: _searchController,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(_radius),
                        bottomLeft: Radius.circular(_radius)),
                  ),
                ),
                onSubmitted: (value) =>
                    ref.read(cityProvider.state).state = value,
              ),
            ),
          ),*/
          InkWell(
            child: Container(
              height: 30,
              alignment: Alignment.center,
              margin:  const EdgeInsets.only(left: 2.0, right: 5.0),
              decoration: const BoxDecoration(
                color: AppColors.accentColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(_radius),
                  bottomRight: Radius.circular(_radius),
                  topLeft: Radius.circular(_radius),
                  bottomLeft: Radius.circular(_radius),

                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text('Dakar',
                    style: Theme.of(context).textTheme.bodyText1),
              ),
            ),
            onTap: () {
              FocusScope.of(context).unfocus();
              _searchController.text = ref.read(cityProvider3);
              ref.read(cityProvider.state).state = _searchController.text;
            },
          ),
          InkWell(
            child: Container(
              height: 30,
              alignment: Alignment.center,
              margin:  const EdgeInsets.only(left: 5.0, right: 5.0),
              decoration: const BoxDecoration(
                color: AppColors.accentColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(_radius),
                  bottomRight: Radius.circular(_radius),
                  topLeft: Radius.circular(_radius),
                  bottomLeft: Radius.circular(_radius),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text('Abidjan',
                    style: Theme.of(context).textTheme.bodyText1),
              ),
            ),
            onTap: () {
              FocusScope.of(context).unfocus();
              _searchController.text = ref.read(cityProvider1);
              ref.read(cityProvider.state).state = _searchController.text;
            },
          ),
          InkWell(
            child: Container(
              height: 30,
              alignment: Alignment.center,
              margin:  const EdgeInsets.only(left: 5.0, right: 1.0),
              decoration: const BoxDecoration(
                color: AppColors.accentColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(_radius),
                  bottomRight: Radius.circular(_radius),
                  topLeft: Radius.circular(_radius),
                  bottomLeft: Radius.circular(_radius),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text('London',
                    style: Theme.of(context).textTheme.bodyText1),
              ),
            ),
            onTap: () {
              FocusScope.of(context).unfocus();
              _searchController.text = ref.read(cityProvider2);
              ref.read(cityProvider.state).state = _searchController.text;
            },
          ),
          InkWell(
            child: Container(
              height: 30,
              alignment: Alignment.center,
              margin:  const EdgeInsets.only(left: 1,bottom: 250.0),
              decoration: const BoxDecoration(
                color: AppColors.searchColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(_radius),
                  bottomRight: Radius.circular(_radius),
                  topLeft: Radius.circular(_radius),
                  bottomLeft: Radius.circular(_radius),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text('Search',
                    style: Theme.of(context).textTheme.bodyText1),
              ),

            ),
            onTap: () {
              FocusScope.of(context).unfocus();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WeatherPageAll(city: 'Dakar')),
              );
            },
          ),
        ],
      ),
    );
  }
}
