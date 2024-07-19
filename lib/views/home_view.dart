import 'package:bloc_refresh/bloc/event_bloc.dart';
import 'package:bloc_refresh/bloc/state_bloc.dart';
import 'package:bloc_refresh/bloc/teams_bloc.dart';
import 'package:bloc_refresh/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    initialFetch();
    super.initState();
  }

  void initialFetch() {
    context.read<TeamBloc>().add(const LoadTeamAction(team: Team.developer));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Bloc Refresh Series"),
          actions: const [PopupMenuButtom()],
        ),
        body: BlocBuilder<TeamBloc, FetchResult?>(
          buildWhen: (previous, current) => current!.teams.isNotEmpty,
          builder: (context, state) {
            if (state != null) {
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.teams.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        state.teams[index].name.toString(),
                      ),
                      subtitle: Text(state.teams[index].profession!),
                      trailing: Text("Age : ${state.teams[index].age!}"),
                    );
                  });
            } else {
              return const Center(
                child: Text("Please Reload The Result"),
              );
            }
          },
        ));
  }
}

class PopupMenuButtom extends StatelessWidget {
  const PopupMenuButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) => [
        const PopupMenuItem<int>(
          value: 1,
          enabled: true,
          child: Text("Developer"),
        ),
        const PopupMenuItem<int>(
          value: 2,
          enabled: true,
          child: Text("Manager"),
        ),
      ],
      onSelected: (index) async {
        if (index == 1) {
          print(index);
          context
              .read<TeamBloc>()
              .add(const LoadTeamAction(team: Team.developer));
        }
        if (index == 2) {
          print(index);
          context
              .read<TeamBloc>()
              .add(const LoadTeamAction(team: Team.manager));
        }
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      color: Theme.of(context).canvasColor,
      elevation: 4.0,
    );
  }
}
