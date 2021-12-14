// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:interface_example1/classes/modelli/parametri_modello.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/classes/modelli/variabili_globali.dart';

class ParametriTree extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const ParametriTree({Key? key, required this.width, required this.title});
  final String title;
  final double width;

  /// expandedNode è una variabile che viene sovrascritta con la chiave dell'ultimo
  /// nodo espanso o selezionato e serve per tenere in memoria l'ultima operazione
  /// effettuata

  @override
  ParametriTreeState createState() => ParametriTreeState();
}

class ParametriTreeState extends State<ParametriTree> {
  late TreeViewController _treeViewController;
  bool docsOpen = false;
  bool deepExpanded = true;
  final ExpanderPosition _expanderPosition = ExpanderPosition.start;
  final ExpanderType _expanderType = ExpanderType.caret;
  final ExpanderModifier _expanderModifier = ExpanderModifier.none;
  final bool _allowParentSelect = false;
  final bool _supportParentDoubleTap = false;

  @override
  void initState() {
    debugPrint("INIT selezionato" + selezionato.value);
    _treeViewController = TreeViewController(
      children: _buildMainNode(),
      selectedKey: selezionato.value,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TreeViewTheme _treeViewTheme = TreeViewTheme(
      expanderTheme: ExpanderThemeData(
          animated: true,
          type: _expanderType,
          modifier: _expanderModifier,
          position: _expanderPosition,
          size: 20,
          color: onSurface),
      labelStyle: const TextStyle(
        fontSize: 16,
        letterSpacing: 0.3,
      ),
      parentLabelStyle: TextStyle(
        fontSize: 16,
        letterSpacing: 0.1,
        fontWeight: FontWeight.w300,
        color: getEmphasis(onSurface, emphasis.high),
      ),
      iconTheme: IconThemeData(
        size: 18,
        color: getEmphasis(onSurface, emphasis.high),
      ),
      colorScheme: Theme.of(context).colorScheme,
    );
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: widget.width,
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: TreeView(
                        shrinkWrap: true,
                        controller: _treeViewController.copyWith(
                            children: _buildMainNode()),
                        allowParentSelect: _allowParentSelect,
                        supportParentDoubleTap: _supportParentDoubleTap,
                        onExpansionChanged: (key, expanded) {
                          //_expandNode(key, expanded);
                          expandedNode = key;
                        },
                        onNodeTap: (key) {
                          selezionato.value = key;
                          expandedNode = key;
                          var temp = selezionato.value.split(".");
                          if (temp.length > 2) {
                            var iG = temp[1];
                            var iA = temp[2];
                            indiceGruppi = int.parse(iG);
                            indiceAttuatori = int.parse(iA);
                          }

                          setState(() {
                            selezionato.value = key;
                            debugPrint("Selezionato: " + selezionato.value);
                            _treeViewController = _treeViewController.copyWith(
                                selectedKey: key, children: _buildMainNode());
                          });
                        },
                        theme: _treeViewTheme,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  /*_expandNode(String key, bool expanded) {
    /*String msg = '${expanded ? "Expanded" : "Collapsed"}: $key ';
    debugPrint(msg);
    Node? node = _treeViewController.getNode(key);
    if (node != null) {
      List<Node> updated;
      updated = _treeViewController.updateNode(
          key,
          node.copyWith(
            expanded: expanded,
            icon: expanded ? Icons.folder_open : Icons.folder,
          ));

      setState(() {
        docsOpen = expanded;
        _treeViewController = _treeViewController.copyWith(children: updated);
      });
    }*/
  }*/

  List<Node<dynamic>> _buildMainNode() {
    List<Node<dynamic>> node = [];
    bool expanded = false;
    String key = "0";
    var splittedExpanded = expandedNode.split(".");
    //debugPrint("EXPANDEDNODE:" + widget.expandedNode);
    //debugPrint("key:" + key);
    if (key == splittedExpanded[0]) {
      expanded = true;
    } else {
      expanded = false;
    }
    node.add(Node(
        key: key,
        expanded: expanded,
        icon: docsOpen ? Icons.folder_open : Icons.folder,
        label: "Parametri Attuatori",
        children: _buildGroupNode(key)));
    return node;
  }

  List<Node<dynamic>> _buildGroupNode(String parentKey) {
    List<Node<dynamic>> node = [];
    int i = 0;
    bool expanded = false;

    for (var item in parametri.value) {
      String key = parentKey + "." + i.toString();
      var splittedKey = key.split(".");
      var splittedExpanded = expandedNode.split(".");
      if (splittedKey[1] == splittedExpanded[1]) {
        expanded = true;
      } else {
        expanded = false;
      }
      debugPrint(item.gruppo);
      node.add(Node(
          key: key,
          expanded: expanded,
          icon: docsOpen ? Icons.folder_open : Icons.folder,
          label: item.gruppo,
          children: _buildParameterNode(item.attuatori, key)));

      i++;
    }
    return node;
  }

  List<Node<dynamic>> _buildParameterNode(
      List<Attuatori> motorlist, String parentKey) {
    List<Node<dynamic>> node = [];
    int i = 0;
    for (var item in motorlist) {
      String key = parentKey + "." + i.toString();
      node.add(Node(
        key: key,
        icon: Icons.tune,
        label: item.nome,
      ));
      i++;
    }
    return node;
  }
}
