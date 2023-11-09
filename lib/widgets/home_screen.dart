import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sandbox_flutter/models/game_models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var click = context.watch<ClickModel>();
    var levelGame = context.watch<LevelModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(200, 133, 251, 173),
        title: Center(child: Text("Clicker")),
      ),
      body: Container(
        width: double.infinity,
        color: Color.fromARGB(200, 213, 255, 208),
        child: Column(
          children: [
            Text("Твой уровень ${levelGame.level}"),
            Text(levelGame.errText),
            Text("${click.numClick}"),
            Text(click.err),
            ElevatedButton(
                onPressed: () {
                  click.Click(levelGame.level);
                },
                child: Text("click")),
            ...GenButtons(levelGame, click),
          ],
        ),
      ),
    );
  }
}

List<Widget> GenButtons(LevelModel levelPlay, ClickModel numClick) {
  List<Widget> listButtons = [];
  for (var i = 0; i < levelPlay.maxLevel; i++) {
    listButtons
        .add(Button(levelPlayer: levelPlay, numClick: numClick, levelUp: i));
  }
  return listButtons;
}

class Button extends StatelessWidget {
  LevelModel levelPlayer;
  ClickModel numClick;
  int levelUp;
  Button(
      {super.key,
      required this.levelPlayer,
      required this.numClick,
      required this.levelUp});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (numClick.numClick < 10) {
            numClick.err = "недостаточно средств";
            return;
          }
          numClick.numClick -= 10;
          levelPlayer.upLevel();
          return;
        },
        child: Text("купить улучшение ${levelUp + 1}?"));
  }
}
