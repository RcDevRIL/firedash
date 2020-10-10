import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firedash/data/models/models.dart';
import 'package:firedash/ui/widgets/info_dialog.dart';
import 'package:firedash/utils/dialog_service.dart';
import 'package:firedash/utils/service_locator.dart';
import 'package:flutter/material.dart';

class BabyVotesPage extends StatefulWidget {
  @override
  _BabyVotesPageState createState() {
    return _BabyVotesPageState();
  }
}

class _BabyVotesPageState extends State<BabyVotesPage> {
  ScrollController _scrollController;

  double _listItemExtent;
  double _trailingTopPadding;

  static const double _listPadding = 20;
  static const double _voteOptionsHeight = 40;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    _listItemExtent = MediaQuery.of(context).size.height / 6;
    _trailingTopPadding = _listItemExtent * 0.5 - _voteOptionsHeight;
    return Scaffold(
      appBar: AppBar(title: Text('Baby Names')),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            getIt<DialogService>().featureNotAvailableDialog(context),
        child: Icon(
          Icons.add,
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('baby').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.docs);
      },
    );
  }

  Widget _buildList(
      BuildContext context, List<QueryDocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.all(_listPadding),
      itemExtent: _listItemExtent,
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return Container(
      key: ValueKey(record.name),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColorDark,
        ),
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white60,
      ),
      height: _listItemExtent - _listPadding * 4,
      child: ListTile(
        title: Text(record.name),
        subtitle: Container(
          height: _listItemExtent * 0.7,
          child: Scrollbar(
            radius: Radius.circular(120),
            child: SingleChildScrollView(
              controller: _scrollController,
              clipBehavior: Clip.hardEdge,
              child: Text(record.description),
            ),
          ),
        ),
        trailing: Padding(
          padding: EdgeInsets.only(
            top: _trailingTopPadding,
          ),
          child: Container(
            height: _voteOptionsHeight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () => record.reference
                      .update({'votes': FieldValue.increment(-1)}),
                  shape: CircleBorder(
                    side: BorderSide(
                      color: Colors.red[300],
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                  minWidth: 0.0,
                  clipBehavior: Clip.antiAlias,
                  enableFeedback: true,
                  child: Icon(
                    Icons.exposure_minus_1,
                    semanticLabel: '-1',
                    size: 14,
                    color: Colors.red[300],
                  ),
                  color: Colors.grey[100],
                  hoverColor: Colors.transparent,
                ),
                Text(
                  record.votes.toString(),
                  textWidthBasis: TextWidthBasis.longestLine,
                ),
                MaterialButton(
                  onPressed: () => record.reference
                      .update({'votes': FieldValue.increment(1)}),
                  shape: CircleBorder(
                      side: BorderSide(
                    color: Colors.teal,
                    width: 1.0,
                    style: BorderStyle.solid,
                  )),
                  minWidth: 0.0,
                  clipBehavior: Clip.antiAlias,
                  enableFeedback: true,
                  child: Icon(
                    Icons.exposure_plus_1,
                    semanticLabel: '+1',
                    size: 14,
                    color: Colors.teal,
                  ),
                  color: Colors.grey[100],
                  hoverColor: Colors.transparent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
