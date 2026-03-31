import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/routes/provider_routes/provider_routes_constants.dart';
import 'fake_data.dart';

class ServicePreview extends StatefulWidget {
  const ServicePreview({super.key});

  @override
  State<ServicePreview> createState() => _ServicePreviewState();
}

class _ServicePreviewState extends State<ServicePreview> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: FakeData.mockData.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final provider = FakeData.mockData[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(provider.profileImage),
              ),
              title: Row(
                children: [
                  Text(provider.providerName),
                  SizedBox(width: 5),
                  Icon(Icons.verified_user),
                ],
              ),
              subtitle: Text(provider.location),
              trailing: ElevatedButton(
                onPressed: () {
                  context.push(ProviderRoutesConstants.providerProfileView);
                },
                child: Text('Book'),
              ),
            ),
            SizedBox(height: 6),

            /// Category
            Text(
              provider.categoryName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        );
      },
    );
  }
}
