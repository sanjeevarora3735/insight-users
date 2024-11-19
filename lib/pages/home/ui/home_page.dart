import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insight_users/navigation/my_routes.dart';
import 'package:insight_users/pages/home/bloc/home_page_bloc.dart';
import 'package:insight_users/pages/home/ui/search_box.dart';
import 'package:insight_users/pages/home/ui/user_card.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  final dynamic args;

  const HomePage({super.key, this.args});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomePageBloc>(context).add(LoadUsersInfo());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.withOpacity(0.5)), shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.chevron_left, color: Colors.black,
            size: 30,
          ),
        ),
      ),
      body: Material(
        color: Colors.white,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'People',
                    style: GoogleFonts.poppins(color: Colors.black, fontSize: 26, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SearchBox(homePageBloc: BlocProvider.of<HomePageBloc>(context)),
              Expanded(
                child: BlocListener<HomePageBloc, HomePageState>(
                  listener: (context, state) async {
                    if (state is HomePageError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Something went wrong: ${state.message}')),
                      );
                    } else if (state is HomePageUsersUpdated) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Users loaded successfully!')),
                      );
                    }else if(state is HomePageDial){
                      final Uri phoneNumber = Uri.parse('tel:+1234567890');
                      if (await canLaunchUrl(phoneNumber)) {
                        await launchUrl(phoneNumber);
                      } else {
                        throw 'Could not open dialer';
                      }
                    }
                  },
                  child: BlocBuilder<HomePageBloc, HomePageState>(
                    buildWhen: (previous, current) => current is HomePageInitial || current is HomePageRenderUsers,
                    builder: (context, state) {
                      if (state is HomePageInitial) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is HomePageRenderUsers) {
                        return RefreshIndicator(
                          onRefresh: () async {
                            BlocProvider.of<HomePageBloc>(context).add(LoadUsersInfo());
                          },
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: state.users.length,
                            itemBuilder: (context, index) {
                              final user = state.users[index];
                              return InkWell(
                                  onTap: (){
                                    Navigator.pushNamed(context, MyRoutes.profilePage, arguments: {
                                      "user":user
                                    });
                                  },
                                  onDoubleTap: (){
                                    BlocProvider.of<HomePageBloc>(context).add(Dial(dialString: user.phone));
                                  },
                                  child: UserCard(contact: user));
                            },
                          ),
                        );
                      } else if (state is HomePageError) {
                        return Center(child: Text(state.message));
                      } else {
                        return const Center(child: Text('Unknown State'));
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
