import 'package:bloc_pattern_app/consts/colors.dart';
import 'package:bloc_pattern_app/logic/characters_bloc.dart';
import 'package:bloc_pattern_app/logic/characters_state.dart';
import 'package:bloc_pattern_app/models/character_model.dart';
import 'package:bloc_pattern_app/screens/main_screen/components/no_internet_widget.dart';
import 'components/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CharactersScreen extends StatefulWidget {
  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  List<CharacterModel>? characters;
  List<CharacterModel>? searchedForCharacters;
  bool isSearching = false;
  final searchEditingController = TextEditingController();

  Widget searchTextField(){
    return TextField(
      controller: searchEditingController,
      decoration: const InputDecoration(
        hintText: 'Enter a character ....',
        border: InputBorder.none,
        hintStyle: TextStyle(
          fontSize: 18,
        ),
      ),
      style: TextStyle(
          color: searchTextColor, fontSize: 18, fontFamily: 'Baloo2 Regular'),
      onChanged: (searchedCharacter) {
        addSearchedCharacterToSearchedList(searchedCharacter);
      },
    );
  }

  void addSearchedCharacterToSearchedList(String searchedCharacter) {
    searchedForCharacters = characters!
        .where((character) =>
        character.name.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersBloc>(context).getAllCharacters();
  }

  Widget buildAppBarTitle() {
    return Text(
      'Characters',
      style: TextStyle(color: titleColor, fontFamily: 'Baloo2 Regular'),
    );
  }

  void startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearching));
    setState(() {
      isSearching = true;
    });
  }

  void stopSearching() {
    clearSearching();
    setState(() {
      isSearching = false;
    });
  }

  void clearSearching() {
    setState(() {
      searchEditingController.clear();
    });
  }

  List<Widget> buildAppbarActions() {
    if (isSearching) {
      return [
        IconButton(
          onPressed: () {
            clearSearching();
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.clear,
            color: searchTextColor,
          ),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: startSearch,
          icon: Icon(
            Icons.search,
            color: searchTextColor,
          ),
        ),
      ];
    }
  }

  Widget buildBlocApp() {
    return BlocBuilder<CharactersBloc, CharactersState>(
      builder: (context, state) {
        if (state is CharactersIsLoaded) {
          characters = (state).characters;
          return SingleChildScrollView(
            child: Container(
              color: cardColor,
              child: Column(
                children: [
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 1,
                      childAspectRatio: 2 / 3,
                      mainAxisSpacing: 1,
                    ),
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: searchEditingController.text.isEmpty
                        ? characters!.length
                        : searchedForCharacters!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CharacterItem(
                        characterModel: searchEditingController.text.isEmpty
                            ? characters![index]
                            : searchedForCharacters![index],
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cardColor,
        leading: isSearching ? BackButton(color: searchTextColor,) : Container(),
        title: isSearching
            ? searchTextField()
            : buildAppBarTitle(),
        actions: buildAppbarActions(),
      ),
      body: OfflineBuilder(
        connectivityBuilder:
            (BuildContext context, ConnectivityResult result, Widget child) {
          final bool connected = result != ConnectivityResult.none;
          if (connected) {
            return buildBlocApp();
          } else {
            return NoInternetWidget();
          }
        },
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
