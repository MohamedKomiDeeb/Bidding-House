import 'package:bidding_house/features/bid/presentation/controllers/bidding_now_cubit.dart';
import 'package:bidding_house/features/bid/presentation/views/widgets/bidding_people.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/imports.dart';

class SecondDetailsSection extends StatelessWidget {
  final Map<String, dynamic> data;

  const SecondDetailsSection({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    int index = data["index"];
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Color(0xff14181B),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Padding(
        padding: EdgeInsets.all(15.w(context)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data["data"]["posts"][index]["title"],
                style: AppTextStyles.style24_700(context, CustomColor.white),
              ),
              SizedBoxApp(
                h: 5.h(context),
              ),
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2of0Y-HF1rRZGFR0XpuOU9f40bcLqQEUgaQ&s'),
                  ),
                  SizedBoxApp(
                    w: 7.w(context),
                  ),
                  Text(
                    'Milinda Peterson',
                    style:
                        AppTextStyles.style14_400(context, CustomColor.white),
                  ),
                ],
              ),
              SizedBoxApp(
                h: 20.w(context),
              ),
              Text(
                'Description',
                style: AppTextStyles.style14_800(context, CustomColor.yellow),
              ),
              Text(
                data["data"]["posts"][index]["desc"],
                style: AppTextStyles.style14_400(context, CustomColor.white),
              ),
              SizedBoxApp(
                h: 15.h(context),
              ),
              Text(
                'Bidding People',
                style: AppTextStyles.style16_800(context, CustomColor.white),
              ),
              SizedBoxApp(
                h: 15.h(context),
              ),
              BlocProvider(
                create: (context) => BiddingNowCubit()
                  ..getBiddingPeople(data["data"]["posts"][index]["id"]),
                child: BlocBuilder<BiddingNowCubit, BiddingNowState>(
                  builder: (context, state) {
                    if (state is BiddingNowFailure) {
                      return Center(
                        child: Text(state.message),
                      );
                    } else if (state is BiddingNowSuccess) {
                      return BiddingPeople(data: state.posts);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}