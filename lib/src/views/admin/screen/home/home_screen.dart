import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaria/src/shared/constants/app.dart';
import 'package:pizzaria/src/shared/controllers/order_controller.dart';
import 'package:pizzaria/src/shared/models/order_model.dart';
import 'package:pizzaria/src/views/admin/screen/home/constants/home_admin.dart';
import 'package:pizzaria/src/views/admin/screen/item/item_screen.dart';
import 'package:pizzaria/src/shared/controllers/auth_controller.dart';
import 'package:pizzaria/src/shared/themes/colors/color_schemes.g.dart';
import 'package:pizzaria/src/shared/services/util_service.dart';
import 'package:pizzaria/src/views/admin/screen/user/user_screen.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class HomeAdminScreen extends StatefulWidget {
  const HomeAdminScreen({super.key});

  @override
  State<HomeAdminScreen> createState() => _HomeAdminScreenState();
}

class _HomeAdminScreenState extends State<HomeAdminScreen> {
  late StompClient stompClient;

  void onConnect(StompClient stompClient, StompFrame stompFrame) {
    stompClient.subscribe(
        destination: '/topic/message',
        callback: (frame) {
          if (frame.body != null) {
            setState(() {});
          }
        });
  }

  @override
  void initState() {
    super.initState();

    stompClient = StompClient(
      config: StompConfig.SockJS(
        url: "${AppConstants.baseUrl}/ws-message",
        onConnect: (stompFrame) => onConnect(stompClient, stompFrame),
      ),
    );

    stompClient.activate();
  }

  @override
  Widget build(BuildContext context) {
    final utilService = UtilService();
    final authController = AuthController();
    final orderController = OrderController();
    return Scaffold(
      //Appbar
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Painel administrativo",
            ),
            IconButton(
              onPressed: () async {
                authController.signOut();
              },
              icon: const Icon(
                Icons.logout,
              ),
            )
          ],
        ),
      ),

      //Body
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisSpacing: 0,
              crossAxisCount: MediaQuery.of(context).size.width < 800 ? 2 : 6,
              children: List.generate(
                HomeAdmin.labels.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(6.0),

                  //Containers menu
                  child: GestureDetector(
                    onTap: () => index.isEqual(1)
                        ? Get.to(const ItemAdminScreen())
                        : index.isEqual(0)
                            ? Get.to(const UserAdminScreen())
                            : null,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: lightColorScheme.primary,
                        ),
                        color: lightColorScheme.background,
                        borderRadius: BorderRadius.circular(12),
                      ),

                      //Title, icon, description
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            maxRadius:
                                utilService.screenDeviceWidth(13, 30, context),
                            child: Icon(HomeAdmin.icons[index]),
                          ),
                          const SizedBox(height: 10),
                          Text(HomeAdmin.labels[index]),
                          Text(
                            HomeAdmin.description[index],
                            style: TextStyle(color: Colors.grey.shade500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          //Orders
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Pedidos em andamento',
                  style: TextStyle(fontSize: 32),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: orderController.get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final orderModel =
                        OrderModel.fromMap(snapshot.data?[index] ?? {});

                    //List oreder
                    return ListTile(
                      //ID
                      title: Text(orderModel.id!),

                      //Items in order
                      subtitle: Row(
                        children: List.generate(
                            orderModel.item!.length,
                            (index) =>
                                Text("+ ${orderModel.item![index]['name']} ")),
                      ),

                      //Total price
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            utilService.convertToBRL(orderModel.total ?? 0),
                            style: const TextStyle(fontSize: 16),
                          ),
                          IconButton(
                            onPressed: () async {
                              await orderController.delete(id: orderModel.id!);
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    stompClient.deactivate();
    super.dispose();
  }
}
