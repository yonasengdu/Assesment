import 'package:assesment/core/constants/theme_constants.dart';
import 'package:assesment/features/hospital/domain/entity/hospital_entity.dart';
import 'package:assesment/features/hospital/presentation/bloc/hospital_bloc.dart';
import 'package:assesment/features/hospital/presentation/widgets/card_widget.dart';
import 'package:assesment/features/hospital/presentation/widgets/loading.dart';
import 'package:assesment/features/hospital/presentation/widgets/message_display.dart';
import 'package:assesment/features/hospital/presentation/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchFieldController = TextEditingController();
  String titleText = "Hospitals";

  void changeHandler(String value) {
    if (value.isNotEmpty) {
      BlocProvider.of<HospitalBloc>(context)
          .add(SearchHospitalEvent(query: value));
    } else {
      BlocProvider.of<HospitalBloc>(context).add(GetHospitalsEvent());
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<HospitalBloc>().add(GetHospitalsEvent());
  }

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    String formattedDate = DateFormat('MMMM d,yyyy').format(date);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchInputField(
                  controller: searchFieldController,
                  onChangedHandler: changeHandler),
              SizedBox(
                height: 15,
              ),
              Text(titleText),
              SizedBox(
                height: 15,
              ),
              Expanded(
                  child: BlocConsumer<HospitalBloc, HospitalState>(
                      listener: (BuildContext context, HospitalState state) {
                if (state is HospitalFailureState) {
                  const MessageDisplay(
                    message: "bad state",
                  );
                }
              }, builder: (context, state) {
                if (state is HospitalLoadingState) {
                  return const Center(
                    child: Loading(),
                  );
                } else if (state is SearchHospitalLoadingState) {
                  return const Center(
                    child: Loading(),
                  );
                } else if (state is SearchHospitalSuccessState) {
                  return ListView.builder(
                      itemCount: state.hospitals.length,
                      itemBuilder: (context, index) {
                        HospitalEntity hospital = state.hospitals[index];
                        return CardWidget(
                          hospital: hospital,
                        );
                      });
                } else if (state is HospitalsSuccessState) {
                  return ListView.builder(
                      itemCount: state.hospitals.length,
                      itemBuilder: (context, index) {
                        HospitalEntity hospital = state.hospitals[index];
                        return CardWidget(
                          hospital: hospital,
                        );
                      });
                } else {
                  return const Center(
                    child: Text('No products available'),
                  );
                }
              }))
            ],
          ),
        ),
        bottomSheet: Container(
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              color: Colors.blue),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.square,
                  size: 50,
                ),
                Icon(
                  Icons.square,
                  size: 50,
                ),
                Icon(
                  Icons.square,
                  size: 50,
                ),
                Icon(
                  Icons.square,
                  size: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
