import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/widget/app_search_field.dart';
import 'package:miqat/features/quran/presentation/view/widget/reciters/reciters_list.dart';
import 'package:miqat/generated/l10n.dart';

class RecitersBody extends StatefulWidget {
  const RecitersBody({super.key, this.initialSearchQuery});

  final String? initialSearchQuery;

  @override
  State<RecitersBody> createState() => _RecitersBodyState();
}

class _RecitersBodyState extends State<RecitersBody> {
  late final TextEditingController _searchController;

  late String searchQuery;

  @override
  void initState() {
    super.initState();

    searchQuery = widget.initialSearchQuery ?? '';

    _searchController = TextEditingController(text: searchQuery);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        children: [
          AppSearchField(
            controller: _searchController,
            hintText: S.of(context).searchReciter,
            onChanged: (value) {
              setState(() {
                searchQuery = value.trim();
              });
            },
          ),

          SizedBox(height: 2.h),

          Expanded(child: RecitersList(searchQuery: searchQuery)),
        ],
      ),
    );
  }
}
