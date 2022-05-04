import 'package:artivatic_mocky/models/mocky_model.dart';
import 'package:artivatic_mocky/providers/list_screen_provider.dart';
import 'package:artivatic_mocky/utils/widget/itemLayout.dart';
import 'package:artivatic_mocky/utils/widget/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatelessWidget {
  ListScreen({Key? key}) : super(key: key);
  ListProvider? provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ListProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(provider!.listData?.title ?? ""),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
            child: IconButton(
                onPressed: () =>
                    provider!.updateSearchActive(!provider!.isSearchActive),
                icon: Icon(
                    provider!.isSearchActive ? Icons.cancel : Icons.search)),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => provider!.refreshListdata(),
        child: provider!.isLoading
            ? const Padding(
                padding: EdgeInsets.all(18.0),
                child: CircularProgressIndicator(
                  strokeWidth: 0.8,
                  color: Colors.white,
                ),
              )
            : const Icon(Icons.refresh),
      ),
      backgroundColor: Colors.blueGrey.shade100,
      body: StatefulWrapper(
        onInit: () => provider!.getListData(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Column(
              children: [
                Visibility(
                  visible: provider!.isSearchActive,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      margin: const EdgeInsets.fromLTRB(8, 8, 8, 16),
                      child: TextField(
                        onChanged: (value) => provider!.updateSearchKey(value),
                        autofocus: true,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 16),
                          labelText: "Search",
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: (provider?.listData?.rows?.length ?? 0) > 0
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: provider?.listData?.rows?.length ?? 0,
                            itemBuilder: (context, index) => (provider!
                                        .listData?.rows?[index].title
                                        ?.toLowerCase()
                                        .contains(provider!.searchKey) ??
                                    false)
                                ? itemLayout(provider!.listData!.rows![index])
                                : Container(),
                          )
                        : const Text("No Data"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
