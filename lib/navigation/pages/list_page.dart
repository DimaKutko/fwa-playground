import 'package:flutter/material.dart';
import 'package:fwa_playground/models/fake_items_generator.dart';
import 'package:fwa_playground/models/item_model.dart';

import 'details_page.dart';

class ListPage extends StatelessWidget {
  final List<ListItem> items;

  ListPage({Key key})
      : items = generateItems(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Mixed List';
  
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        // Let the ListView know how many items it needs to build.
        itemCount: items.length,
        // Provide a builder function. This is where the magic happens.
        // Convert each item into a widget based on the type of item it is.
        itemBuilder: (context, index) {
          final item = items[index];

          if (item is HeadingItem) {
            return ListTile(
              title: Text(
                item.heading,
                style: Theme.of(context).textTheme.headline,
              ),
            );
          } else if (item is MessageItem) {
            return ListTile(
              title: Text(item.sender),
              subtitle: Text(item.body),
              onTap: () {
                
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(
                      title: item.sender,
                      subtitle: item.body,
                    ),
                  ),
                );

              },
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
