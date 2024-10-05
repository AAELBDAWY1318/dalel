import 'package:dalel/features/home/data/sub_models/war_sub_model.dart';

class HistoricalPeriod {
  final String title;
  final String description;
  final String image;
  final List<WarSubModel> wars;

  HistoricalPeriod(
      {required this.title,
      required this.description,
      required this.image,
      required this.wars});
}
