import 'package:dalel/features/check_out/cubit/check_out_cubit.dart';
import 'package:dalel/features/check_out/presentation/widgets/custom_product_item.dart';
import 'package:dalel/features/home/presentation/widgets/custom_error_text.dart';
import 'package:dalel/features/my_cart/presentation/widgets/custom_loading_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSelectedProductSection extends StatelessWidget {
  final List<String> ids;
  final List<double> paymentList;
  const CustomSelectedProductSection({super.key, required this.ids, required this.paymentList});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: BlocProvider(
        create: (context) => CheckOutCubit()..getProducts(ids),
        child: BlocBuilder<CheckOutCubit, CheckOutState>(
          builder: (context, state) {
            if (state is GetListOfProductFailure) {
              return CustomErrorText(text: state.errorMessage);
            } else if (state is GetListProductSuccess) {
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CustomProductItem(
                      souvenirModel: state.products[index],
                      count: (paymentList[index]~/ double.parse(state.products[index].price)),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 5.0,
                    );
                  },
                  itemCount: state.products.length);
            } else {
              return const CustomLoadingCartList();
            }
          },
        ),
      ),
    );
  }
}
