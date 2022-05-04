
import 'package:artivatic_mocky/providers/list_screen_provider.dart';
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
          onPressed: () => provider!.getListData(),
          child: const Icon(Icons.refresh),
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
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade50,
                                        border: Border.all(
                                            color: Colors.black, width: 1.0),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(
                                                10.0) //                 <--- border radius here
                                            ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          provider!.listData?.rows?[index]
                                                      .imageHref !=
                                                  null
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Image.network(
                                                    provider!
                                                        .listData!
                                                        .rows![index]
                                                        .imageHref!,
                                                    scale: 3.5,
                                                    errorBuilder: (context,
                                                            error,
                                                            stackTrace) =>
                                                        const Icon(Icons
                                                            .hide_image_sharp),
                                                  ),
                                                )
                                              : Container(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    "${provider!.listData?.rows?[index].title}",
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    )),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5),
                                                  child: Text(
                                                      "${provider!.listData?.rows?[index].description}"),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
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
