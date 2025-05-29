import 'package:flutter/material.dart';
import 'package:rive_animation/app/core/constants/app_colors.dart';

class NotificationsTabView extends StatelessWidget {
  const NotificationsTabView({Key? key}) : super(key: key);

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
                  "Notifications",
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
                    Icons.settings_outlined,
                    color: AppColors.accentColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  _buildNotificationGroup("Today"),
                  _buildNotificationTile(
                    title: "New Course Available",
                    message: "Advanced Animation in Flutter is now available",
                    time: "2 hours ago",
                    icon: Icons.school,
                    color: AppColors.cardColor1,
                  ),
                  _buildNotificationTile(
                    title: "Assignment Due",
                    message: "Don't forget to submit your UI design project",
                    time: "5 hours ago",
                    icon: Icons.assignment,
                    color: AppColors.cardColor2,
                    unread: true,
                  ),
                  _buildNotificationGroup("Yesterday"),
                  _buildNotificationTile(
                    title: "Sarah Johnson commented",
                    message: "Great job on your latest project!",
                    time: "1 day ago",
                    icon: Icons.chat_bubble_outline,
                    color: AppColors.cardColor3,
                    unread: true,
                  ),
                  _buildNotificationTile(
                    title: "Progress Update",
                    message:
                        "You've completed 75% of Flutter Development course",
                    time: "1 day ago",
                    icon: Icons.trending_up,
                    color: AppColors.cardColor4,
                  ),
                  _buildNotificationGroup("This Week"),
                  _buildNotificationTile(
                    title: "Live Webinar",
                    message: "Join us for a live Flutter animation masterclass",
                    time: "2 days ago",
                    icon: Icons.live_tv,
                    color: AppColors.accentColor,
                  ),
                  _buildNotificationTile(
                    title: "Course Recommendation",
                    message:
                        "Based on your interests: React Native Fundamentals",
                    time: "3 days ago",
                    icon: Icons.recommend,
                    color: AppColors.cardColor1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationGroup(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }

  Widget _buildNotificationTile({
    required String title,
    required String message,
    required String time,
    required IconData icon,
    required Color color,
    bool unread = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: unread ? Colors.white : Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withOpacity(unread ? 0.1 : 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        border: unread
            ? Border.all(color: AppColors.accentColor.withOpacity(0.3))
            : null,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: color,
            size: 24,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: unread ? FontWeight.bold : FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: const TextStyle(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              time,
              style: TextStyle(
                color: Colors.grey.withOpacity(0.8),
                fontSize: 12,
              ),
            ),
          ],
        ),
        isThreeLine: true,
        trailing: unread
            ? Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: AppColors.accentColor,
                  shape: BoxShape.circle,
                ),
              )
            : null,
      ),
    );
  }
}
