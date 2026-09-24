import 'package:miqat/features/taspeeh/data/model/taspeh_model.dart';
import 'package:miqat/generated/l10n.dart';

class DefaultTaspehData {
  static final List<TaspehModel> data = [
    TaspehModel(
      title: (context) => S.of(context).tasbeeh_subhanAllah,
      target: 33,
    ),

    TaspehModel(
      title: (context) => S.of(context).tasbeeh_alhamdulillah,
      target: 33,
    ),

    TaspehModel(
      title: (context) => S.of(context).tasbeeh_allahuAkbar,
      target: 33,
    ),

    TaspehModel(
      title: (context) => S.of(context).tasbeeh_laIlahaIllallah,
      target: 100,
    ),

    TaspehModel(
      title: (context) => S.of(context).tasbeeh_astaghfirullah,
      target: 100,
    ),

    TaspehModel(
      title: (context) => S.of(context).tasbeeh_salatIbrahim,
      target: 10,
    ),

    TaspehModel(
      title: (context) => S.of(context).tasbeeh_subhanAllahWaBihamdih,
      target: 100,
    ),

    TaspehModel(
      title: (context) => S.of(context).tasbeeh_subhanAllahAlAzeem,
      target: 100,
    ),

    TaspehModel(
      title: (context) => S.of(context).tasbeeh_baqiyatAlsalihat,
      target: 100,
    ),

    TaspehModel(title: (context) => S.of(context).tasbeeh_laHawla, target: 100),
  ];
}
