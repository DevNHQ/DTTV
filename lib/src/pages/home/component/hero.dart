import 'package:dttv/src/libs/move_hero/widgets/local_hero.dart';
import 'package:dttv/src/libs/move_hero/widgets/local_hero_scope.dart';
import 'package:flutter/material.dart';

class LocalHeroPage extends StatelessWidget {
  const LocalHeroPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: LocalHeroScope(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: _LocalHeroPlayground(),
        ),
      ),
    );
  }
}

class _LocalHeroPlayground extends StatefulWidget {
  const _LocalHeroPlayground({
    Key? key,
  }) : super(key: key);

  @override
  _LocalHeroPlaygroundState createState() => _LocalHeroPlaygroundState();
}

class _LocalHeroPlaygroundState extends State<_LocalHeroPlayground> {
  AlignmentGeometry alignment = Alignment.topLeft;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Align(
              alignment: alignment,
              child: const LocalHero(
                tag: 'id',
                child: _Box(),
              ),
            ),
          ),
        ),
        RaisedButton(
          onPressed: () {
            setState(() {
              alignment = alignment == Alignment.topLeft
                  ? Alignment.bottomRight
                  : Alignment.topLeft;
            });
          },
          child: const Text('Move'),
        ),
      ],
    );
  }
}

class _Box extends StatelessWidget {
  const _Box({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: 50,
      height: 50,
    );
  }
}
