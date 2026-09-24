import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/core/service/injection.dart';
import 'package:miqat/features/azkar/data/model/azkar_category_model.dart';
import 'package:miqat/features/azkar/presentation/manager/cubit/azkar_counter_cubit.dart';
import 'package:miqat/features/azkar/presentation/manager/cubit/azkar_cubit.dart';
import 'package:miqat/features/azkar/presentation/view/widget/zekr_item.dart';

class AzkarDetailsPage extends StatefulWidget {
  const AzkarDetailsPage({super.key, required this.model});

  final AzkarCategoryModel model;

  @override
  State<AzkarDetailsPage> createState() => _AzkarDetailsPageState();
}

class _AzkarDetailsPageState extends State<AzkarDetailsPage> {
  final PageController controller = PageController();

  int currentIndex = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<AzkarCubit>()..loadAzkar(widget.model.path),
        ),
        BlocProvider(create: (_) => AzkarCounterCubit(target: 0)),
      ],
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.r),
            child: Column(
              children: [
              Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: Text(
                        widget.model.title(context),
                        textAlign: TextAlign.center,
                        style: AppTextStyle.heading2.copyWith(
                          color: AppColor.primary,
                        ),
                      ),
                    ),

                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: IconButton(
                        onPressed: context.pop,
                        icon: const Icon(
                          FontAwesomeIcons.arrowLeft,
                          color: AppColor.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(color: Theme.of(context).disabledColor, thickness: .5),

                Expanded(
                  child: BlocBuilder<AzkarCubit, AzkarState>(
                    builder: (context, state) {
                      if (state is AzkarLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state is AzkarFailure) {
                        return Center(child: Text(state.message));
                      }

                      if (state is AzkarSuccess) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (currentIndex == 0) {
                            context.read<AzkarCounterCubit>().changeTarget(
                              state.azkar.first.count,
                            );
                          }
                        });

                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            PageView.builder(
                              controller: controller,
                              itemCount: state.azkar.length,
                              onPageChanged: (index) {
                                setState(() {
                                  currentIndex = index;
                                });

                                context.read<AzkarCounterCubit>().changeTarget(
                                  state.azkar[index].count,
                                );
                              },
                              itemBuilder: (_, index) {
                                return ZekrItem(zekr: state.azkar[index]);
                              },
                            ),

                            PositionedDirectional(
                              bottom: 260.h,
                              start: 0,
                              child: CircleAvatar(
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.surface,
                                child: IconButton(
                                  onPressed: currentIndex > 0
                                      ? () {
                                          controller.previousPage(
                                            duration: const Duration(
                                              milliseconds: 250,
                                            ),
                                            curve: Curves.ease,
                                          );
                                        }
                                      : null,
                                  icon: const Icon(
                                    FontAwesomeIcons.arrowRight,
                                    color: AppColor.primary,
                                  ),
                                ),
                              ),
                            ),

                            PositionedDirectional(
                              bottom: 260.h,
                              end: 0,
                              child: CircleAvatar(
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.surface,

                                child: IconButton(
                                  onPressed:
                                      currentIndex < state.azkar.length - 1
                                      ? () {
                                          controller.nextPage(
                                            duration: const Duration(
                                              milliseconds: 250,
                                            ),
                                            curve: Curves.ease,
                                          );
                                        }
                                      : null,
                                  icon: Icon(
                                    FontAwesomeIcons.arrowLeft,
                                    color: AppColor.primary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
