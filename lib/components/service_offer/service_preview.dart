import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/components/service_offer/service_list.dart';
import 'package:mobile/core/themes/colors.dart';
import 'package:mobile/routes/provider_routes/provider_routes_constants.dart';
import '../../core/size_config/size_config.dart';
import 'fake_data.dart';

class ServicePreview extends StatefulWidget {
  const ServicePreview({super.key});

  @override
  State<ServicePreview> createState() => _ServicePreviewState();
}

class _ServicePreviewState extends State<ServicePreview> {
  final services = [
    'Haircut',
    'Shave',
    'Massage',
    'Facial',
    'Facial',
    'Facial',
  ];

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
            InkWell(
              onTap: (){
                context.push(ProviderRoutesConstants.providerProfileView);
              },
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(provider.profileImage),
                    ),
                    title: Row(
                      children: [
                        Text(provider.providerName),
                        SizedBox(width: 5),
                        Icon(
                          Icons.verified,
                          color: AppColors.darkBlueColor,
                          size: 15,
                        ),
                      ],
                    ),
                    subtitle: Text(provider.location),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blackColor,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        fixedSize: Size(90, 10),
                      ),
                      onPressed: () {
                        context.push(ProviderRoutesConstants.providerProfileView);
                      },
                      child: Text('Book', style: TextStyle(color: AppColors.whiteColor)),
                    ),
                  ),
                  SizedBox(height: 6),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockWidth * 4.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Category
                        Text(
                          provider.categoryName,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),

                        SizedBox(height: 8),

                        /// Services (wrap + rounded)
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              services.length,
                                  (index) => Padding(
                                padding: const EdgeInsets.only(right: 6),
                                child: ServiceList(serviceName: services[index]),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 15),

                        Container(
                          height: 1,
                          width: double.infinity,
                          color: AppColors.horizontalLine,
                        ),

                        SizedBox(height: 15),

                        /// 3 Columns Info
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: AppColors.darkBlueColor,
                                ),
                                Text("${provider.rating} (876) "),
                              ],
                            ),
                            Container(
                              height: 20,
                              width: 1,
                              color: AppColors.horizontalLine,
                            ),
                            Row(
                              children: [
                                Text("${provider.experience} Years Experience"),
                              ],
                            ),
                            Container(
                              height: 20,
                              width: 1,
                              color: AppColors.horizontalLine,
                            ),
                            Row(children: [Text("${provider.clients}+ Clients")]),
                          ],
                        ),

                        SizedBox(height: 15),

                        /// Description
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.paragraphBackground,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            provider.description,
                            style: TextStyle(color: AppColors.blackColor),
                          ),
                        ),

                        SizedBox(height: 25),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height: 1,
              width: double.infinity,
              color: AppColors.horizontalLine,
            ),
            SizedBox(height: 25),
          ],
        );
      },
    );
  }
}
