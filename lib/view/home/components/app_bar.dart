import 'package:flutter/material.dart';
import 'package:weather/res/app_url/app_url.dart';
import '../../../res/images/image_assets.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isNotificationEnabled = false;
  TextEditingController locationController = TextEditingController();

  void showNotificationPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Thông báo"),
          content: Text(
            "Bạn đã bật thông báo",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Đóng",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        );
      },
    );
  }

  void showLocationSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Thời tiết",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: TextField(
            controller: locationController,
            decoration: InputDecoration(
              hintText: "Tìm tên thành phố/sân bay",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Thực hiện xử lý khi người dùng nhấn vào nút tìm kiếm
                String location = locationController.text;
                String currentUrl = AppUrl.url;
                if (location.toLowerCase() == "ha noi") {
                  currentUrl = AppUrl.url1;
                }

                // Xử lý dữ liệu địa điểm tại đây, ví dụ: Navigator.push() để chuyển đến màn hình khác để hiển thị dự báo thời tiết
              },
              child: Text(
                "Tìm kiếm",
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                // Thực hiện xử lý khi người dùng đóng hộp thoại
                Navigator.of(context).pop();
              },
              child: Text("Đóng", style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            // Hiển thị hộp thoại tìm kiếm địa điểm khi người dùng nhấn vào nút menu
            showLocationSearchDialog(context);
          },
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.menu,
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isNotificationEnabled = !isNotificationEnabled;
              if (isNotificationEnabled) {
                showNotificationPopup(context);
              }
            });
          },
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Icon(
              isNotificationEnabled
                  ? Icons.notifications
                  : Icons.notifications_none,
              color: isNotificationEnabled ? Colors.grey : Colors.grey,
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            ImageAssets.nightRain,
            height: 30,
            width: 30,
          ),
        )
      ],
    );
  }
}
