import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/core/widget/custom_loading_indicator.dart';
import 'package:miqat/features/taspeeh/presentation/manager/cubit/taspeeh_cubit.dart';
import 'package:miqat/features/taspeeh/presentation/manager/cubit/taspeeh_state.dart';
import 'package:miqat/features/taspeeh/presentation/view/widget/taspeeh_delete_sheet.dart';
import 'package:miqat/features/taspeeh/presentation/view/widget/taspeh_card.dart';
import 'package:miqat/generated/l10n.dart';

class TaspehGridView extends StatelessWidget {
  const TaspehGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaspeehCubit, TaspeehState>(
      builder: (context, state) {
        if (state is TaspeehLoading) {
          return const CustomLoadingIndicator();
        }

        if (state is TaspeehLoaded) {
          final defaultList = state.defaultTaspeehs;
          final userList = state.userTaspeehs;

          return CustomScrollView(
            slivers: [
              SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  if (index < defaultList.length) {
                    final item = defaultList[index];

                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 6.h,
                      ),
                      child: TaspehCard(
                        title: item.title(context),
                        target: item.target,
                      ),
                    );
                  }

                  final item = userList[index - defaultList.length];

                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 6.h,
                    ),
                    child: TaspehCard(
                      title: item.title,
                      target: item.target,
                      onLongPress: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (sheetContext) {
                            return TaspeehDeleteSheet(
                              onDelete: () async {
                                final cubit = context.read<TaspeehCubit>();

                                await cubit.deleteTasbeeh(item.id);

                                if (sheetContext.mounted) {
                                  Navigator.pop(sheetContext);
                                }
                              },
                            );
                          },
                        );
                      },
                    ),
                  );
                }, childCount: defaultList.length + userList.length),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 270,
                ),
              ),

              if (userList.isNotEmpty)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.h, bottom: 14.h),
                    child: Text(
                      S.of(context).tasbeeh_deleteHint,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.bodyMedium,
                    ),
                  ),
                ),
            ],
          );
        }

        if (state is TaspeehError) {
          return Center(child: Text(state.message));
        }

        return const SizedBox.shrink();
      },
    );
  }
}
