import 'package:electronic_data/ui/pages/detail/components/bottom_bar.dart';
import 'package:electronic_data/ui/pages/detail/components/chart_widget.dart';
import 'package:electronic_data/ui/pages/detail/components/data_widget.dart';
import 'package:electronic_data/ui/pages/detail/cubit/detail_cubit.dart';
import 'package:electronic_data/ui/pages/detail/cubit/detail_state.dart';
import 'package:electronic_data/ui/resources/themes/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return DetailCubit();
      },
      child: const DetailView(),
    );
  }
}

class DetailView extends StatefulWidget {
  const DetailView({super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  late DetailCubit cubit = context.read<DetailCubit>();
  PageController pageController = PageController(initialPage: 0);
  int curIndex = 0;

  @override
  void initState() {
    super.initState();
    cubit.startPolling();
    cubit.getHistoryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "PZEM004T",
              style: AppTextTheme.blackS14Bold,
            ),
            // const Spacer(),
            Container(
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            )
          ],
        ),
      ),
      body: BlocBuilder<DetailCubit, DetailState>(
        builder: (context, state) {
          return SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: [
                    SizedBox(
                        child: DataWidget(
                      dataModel: state.dataModel,
                    )),
                     SizedBox(child: ChartWidget(statisticalV4: state.statisticalV4,statisticalV7: state.statisticalV7,)),
                  ],
                ),
                BottomBar(
                  onTap: (p0) {
                    if (curIndex != p0) {
                      curIndex = p0;
                      pageController.animateToPage(
                        p0,
                        curve: Curves.easeIn,
                        duration: const Duration(milliseconds: 500),
                      );
                    }
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
