import 'package:flutter/material.dart';
import 'package:playground/intaractor/usecase/entity/Ticker.dart';
import 'package:playground/ui/MainBloc.dart';
import 'package:provider/provider.dart';

class MainView extends StatefulWidget {
  MainView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<MainBloc>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _text(bloc),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.getTicker.add(null),
        tooltip: 'Refresh',
        child: Icon(Icons.refresh),
      ),
    );
  }

  Widget _text(MainBloc bloc) {
    return StreamBuilder<Ticker>(
      stream: bloc.ticker,
      builder: (context, snapshot) {
        String text = '';
        if (snapshot.hasData && snapshot.data != null) {
          text =
              'Last: ${snapshot.data!.last}\nBid: ${snapshot.data!.bid}\nAsk: ${snapshot.data!.ask}\nHigh: ${snapshot.data!.high}\nLow: ${snapshot.data!.low}\nVolume: ${snapshot.data!.volume}\nDate: ${snapshot.data!.date}';
        }

        return Text(
          text,
          style: Theme.of(context).textTheme.headline4,
        );
      },
    );
  }
}
