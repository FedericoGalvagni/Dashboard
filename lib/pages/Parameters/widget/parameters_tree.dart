import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:interface_example1/constants/style.dart';
import 'package:interface_example1/data_models/parameters_data.dart';
import 'package:interface_example1/pages/Parameters/widget/parameters_view.dart';
import 'package:interface_example1/widgets/custom/custom_text.dart';
import 'package:interface_example1/widgets/spacer/large_horizontal_spacer.dart';
import 'package:interface_example1/widgets/spacer/large_vertical_spacer.dart';

class ParametersTree extends StatefulWidget {
  const ParametersTree({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  ParametersTreeState createState() => ParametersTreeState();
}

class ParametersTreeState extends State<ParametersTree> {
  String _selectedNode = "";
  late TreeViewController _treeViewController;
  bool docsOpen = false;
  bool deepExpanded = false;
  final ExpanderPosition _expanderPosition = ExpanderPosition.start;
  final ExpanderType _expanderType = ExpanderType.caret;
  final ExpanderModifier _expanderModifier = ExpanderModifier.none;
  final bool _allowParentSelect = false;
  final bool _supportParentDoubleTap = false;

  @override
  void initState() {
    _treeViewController = TreeViewController(
      children: _buildMainNode(),
      selectedKey: _selectedNode,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    TreeViewTheme _treeViewTheme = TreeViewTheme(
      expanderTheme: ExpanderThemeData(
          animated: true,
          type: _expanderType,
          modifier: _expanderModifier,
          position: _expanderPosition,
          // color: Colors.grey.shade800,
          size: 20,
          color: textOnSurface),
      labelStyle: const TextStyle(
        fontSize: 16,
        letterSpacing: 0.3,
      ),
      parentLabelStyle: TextStyle(
        fontSize: 16,
        letterSpacing: 0.1,
        fontWeight: FontWeight.w800,
        color: getEmphasis(textOnSurface, emphasis.high),
      ),
      iconTheme: IconThemeData(
        size: 18,
        color: getEmphasis(textOnSurface, emphasis.high),
      ),
      colorScheme: Theme.of(context).colorScheme,
    );
    return Column(
      children: [
        const LargeVSpacer(),
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const LargeHSpacer(),
            Container(
              decoration: BoxDecoration(
                  color: surface(2), borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(height: 20),
                  Container(
                    width: (_width / 4) - 40,
                    margin: const EdgeInsets.only(left: 20),
                    child: CustomText(
                        text: "Browser",
                        weight: FontWeight.w600,
                        size: 20,
                        color: textOnSurface),
                  ),
                  SizedBox(
                    width: _width / 4,
                    child: GestureDetector(
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: TreeView(
                          shrinkWrap: true,
                          controller: _treeViewController,
                          allowParentSelect: _allowParentSelect,
                          supportParentDoubleTap: _supportParentDoubleTap,
                          onExpansionChanged: (key, expanded) =>
                              _expandNode(key, expanded),
                          onNodeTap: (key) {
                            debugPrint('Selected: $key');
                            setState(() {
                              _selectedNode = key;
                              _treeViewController = _treeViewController
                                  .copyWith(selectedKey: key);
                            });
                          },
                          theme: _treeViewTheme,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      width: (_width / 4) - 40,
                      height: 1,
                      decoration: BoxDecoration(
                        color: divider,
                        borderRadius: BorderRadius.circular(1),
                      )),
                  Container(
                    width: (_width / 4) - 40,
                    margin: EdgeInsets.only(left: 20),
                    child: CustomText(
                        text: "Tool",
                        weight: FontWeight.w600,
                        size: 20,
                        color: textOnSurface),
                  ),
                  Container(height: 10),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: (_width / 4) - 40,
                      margin: EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.restore,
                            color: Colors.green,
                          ),
                          Container(
                            width: 5,
                          ),
                          //TODO: implement restore function
                          CustomText(
                            text: "Restore",
                            size: 15,
                            color: getEmphasis(textOnSurface, emphasis.high),
                            weight: FontWeight.normal,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const LargeHSpacer(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: surface(4), borderRadius: BorderRadius.circular(10)),
                child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        color: surface(4),
                        borderRadius: BorderRadius.circular(10)),
                    child: ParametersView(treeviewKey: _selectedNode)),
              ),
            ),
            const LargeHSpacer(),
          ],
        ),
      ],
    );
  }

  _expandNode(String key, bool expanded) {
    String msg = '${expanded ? "Expanded" : "Collapsed"}: $key';
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
    }
  }

  List<Node<dynamic>> _buildMainNode() {
    List<Node<dynamic>> node = [];
    node.add(Node(
        key: "motor parameter",
        expanded: false,
        icon: docsOpen ? Icons.folder_open : Icons.folder,
        label: "Motors Parameter",
        children: _buildGroupNode()));
    return node;
  }

  List<Node<dynamic>> _buildGroupNode() {
    List<Node<dynamic>> node = [];
    int i = 0;
    for (var item in parameter.motorParameters) {
      node.add(Node(
          key: item.groupName,
          expanded: false,
          icon: docsOpen ? Icons.folder_open : Icons.folder,
          label: item.groupName,
          children: _buildMotorNode(item.motorList, i)));
      i++;
    }
    return node;
  }

  List<Node<dynamic>> _buildMotorNode(List<MotorList> motorlist, int key) {
    List<Node<dynamic>> node = [];
    int i = 0;
    for (var item in motorlist) {
      node.add(Node(
        key: key.toString() + "." + i.toString(),
        icon: Icons.tune,
        label: item.motorName,
      ));
      i++;
    }
    return node;
  }
}
