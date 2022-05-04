import 'package:artivatic_mocky/providers/list_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatelessWidget {
  ListScreen({Key? key}) : super(key: key);
  ListProvider? provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ListProvider>(context);
    provider!.getListData();
    return Scaffold(
      appBar: AppBar(
        title: Text(provider!.listData?.title ?? ""),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => provider!.getListData(),
        child: const Icon(Icons.refresh),
      ),
      body: Container(
        child: (provider?.listData?.rows?.length ?? 0) > 0
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: provider?.listData?.rows?.length ?? 0,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          border: Border.all(color: Colors.black, width: 1.0),
                          borderRadius: const BorderRadius.all(Radius.circular(
                                  10.0) //                 <--- border radius here
                              ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            provider!.listData?.rows?[index].imageHref != null
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.network(
                                      provider!
                                          .listData!.rows![index].imageHref!,
                                      scale: 3.5,
                                      errorBuilder: (context, error,
                                              stackTrace) =>
                                          const Icon(Icons.hide_image_sharp),
                                    ),
                                  )
                                : Container(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      "${provider!.listData?.rows?[index].title}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                        "${provider!.listData?.rows?[index].description}"),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ))
            : const Text("No Data"),
      ),
    );
  }
}
