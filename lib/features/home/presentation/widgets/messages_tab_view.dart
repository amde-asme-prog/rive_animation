import 'package:flutter/material.dart';
import 'package:rive_animation/app/core/constants/app_colors.dart';

class MessagesTabView extends StatelessWidget {
  const MessagesTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Messages",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadow.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.edit,
                    color: AppColors.accentColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadow.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search messages...",
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  _buildMessageTile(
                    name: "Sarah Johnson",
                    message: "When will the next lesson be available?",
                    time: "2m ago",
                    unread: true,
                    avatar: "S",
                    color: AppColors.cardColor1,
                  ),
                  _buildMessageTile(
                    name: "Flutter Dev Group",
                    message: "Mike: I've submitted my project for review",
                    time: "1h ago",
                    unread: true,
                    avatar: "F",
                    color: AppColors.cardColor2,
                    isGroup: true,
                  ),
                  _buildMessageTile(
                    name: "David Wilson",
                    message: "Thanks for your help with the animation code!",
                    time: "3h ago",
                    unread: false,
                    avatar: "D",
                    color: AppColors.cardColor3,
                  ),
                  _buildMessageTile(
                    name: "Emma Thompson",
                    message: "Could you review my UI design, please?",
                    time: "Yesterday",
                    unread: false,
                    avatar: "E",
                    color: AppColors.cardColor4,
                  ),
                  _buildMessageTile(
                    name: "UI/UX Community",
                    message: "Alex: Check out this new design system",
                    time: "2d ago",
                    unread: false,
                    avatar: "U",
                    color: AppColors.accentColor,
                    isGroup: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageTile({
    required String name,
    required String message,
    required String time,
    required bool unread,
    required String avatar,
    required Color color,
    bool isGroup = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Stack(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: color,
              child: Text(
                avatar,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            if (isGroup)
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.people,
                    size: 12,
                    color: AppColors.accentColor,
                  ),
                ),
              ),
          ],
        ),
        title: Text(
          name,
          style: TextStyle(
            fontWeight: unread ? FontWeight.bold : FontWeight.w500,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          message,
          style: TextStyle(
            color: unread ? AppColors.text : Colors.grey,
            fontWeight: unread ? FontWeight.w500 : FontWeight.normal,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              time,
              style: TextStyle(
                color: unread ? AppColors.accentColor : Colors.grey,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 5),
            if (unread)
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: AppColors.accentColor,
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  "1",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
