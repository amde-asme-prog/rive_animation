import 'package:flutter/material.dart';
import 'package:rive_animation/app/core/constants/app_colors.dart';

class CourseModel {
  final UniqueKey id;
  final String title;
  final String subtitle;
  final String caption;
  final String imageUrl;
  final Color color;
  final double progress;

  CourseModel({
    required this.title,
    required this.subtitle,
    required this.caption,
    required this.imageUrl,
    required this.color,
    required this.progress,
  }) : id = UniqueKey();

  static List<CourseModel> get courses => [
        CourseModel(
          title: "UI Design",
          subtitle: "Design System",
          caption: "12 sections - 3 hours",
          imageUrl: "assets/images/ui_design.png",
          color: AppColors.cardColor1,
          progress: 0.8,
        ),
        CourseModel(
          title: "Flutter Dev",
          subtitle: "Animation in Flutter",
          caption: "10 sections - 2 hours",
          imageUrl: "assets/images/flutter_dev.png",
          color: AppColors.cardColor2,
          progress: 0.5,
        ),
        CourseModel(
          title: "React Native",
          subtitle: "Components & Styling",
          caption: "8 sections - 1.5 hours",
          imageUrl: "assets/images/react_native.png",
          color: AppColors.cardColor3,
          progress: 0.3,
        ),
      ];

  static List<CourseModel> get courseSections => [
        CourseModel(
          title: "Animations in Flutter",
          subtitle: "Create complex animations",
          caption: "Watch video - 15 mins",
          imageUrl: "assets/images/flutter_animations.png",
          color: AppColors.cardColor1,
          progress: 0.5,
        ),
        CourseModel(
          title: "Responsive Layout",
          subtitle: "Build for all devices",
          caption: "Read article - 10 mins",
          imageUrl: "assets/images/responsive_layout.png",
          color: AppColors.cardColor2,
          progress: 0.3,
        ),
        CourseModel(
          title: "State Management",
          subtitle: "Provider vs Riverpod",
          caption: "Watch video - 20 mins",
          imageUrl: "assets/images/state_management.png",
          color: AppColors.cardColor3,
          progress: 0.8,
        ),
        CourseModel(
          title: "Custom Widgets",
          subtitle: "Create reusable components",
          caption: "Complete exercise - 25 mins",
          imageUrl: "assets/images/custom_widgets.png",
          color: AppColors.cardColor4,
          progress: 0.2,
        ),
      ];
}
