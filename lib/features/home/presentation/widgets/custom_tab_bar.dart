import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;
import 'package:rive_animation/app/core/constants/app_assets.dart';
import 'package:rive_animation/app/core/constants/app_colors.dart';
import 'package:rive_animation/features/home/data/model/tab.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key, required this.onTabChange});

  final Function(int tabIndex) onTabChange;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  final List<TabItem> _icons = TabItem.tabItemsList;

  int _selectedTab = 0;

  void _onRiveIconInit(rive.Artboard artboard, int index) {
    final controller = rive.StateMachineController.fromArtboard(
        artboard, _icons[index].stateMachine);

    if (controller != null) {
      artboard.addController(controller);
      _icons[index].status = controller.findSMI('active') as rive.SMIBool;
    }
  }

  void onTabPress(int index) {
    if (_selectedTab != index) {
      setState(() {
        _selectedTab = index;
      });
      widget.onTabChange(index);

      if (_icons[index].status != null) {
        _icons[index].status!.change(true);
        Future.delayed(const Duration(seconds: 1), () {
          if (_icons[index].status != null) {
            _icons[index].status!.change(false);
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(24, 0, 24, 8),
        padding: const EdgeInsets.all(1),
        constraints: const BoxConstraints(maxWidth: 768),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(colors: [
            Colors.white.withOpacity(0.5),
            Colors.white.withOpacity(0)
          ]),
        ),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: AppColors.background2.withOpacity(0.8),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 20),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_icons.length, (index) {
              TabItem icon = _icons[index];

              return Expanded(
                key: icon.id,
                child: CupertinoButton(
                  padding: const EdgeInsets.all(12),
                  child: AnimatedOpacity(
                    opacity: _selectedTab == index ? 1 : 0.5,
                    duration: const Duration(milliseconds: 200),
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: -4,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: 4,
                            width: _selectedTab == index ? 20 : 0,
                            decoration: BoxDecoration(
                              color: AppColors.accentColor,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 36,
                          width: 36,
                          child: rive.RiveAnimation.asset(
                            AppAssets.icons,
                            stateMachines: [icon.stateMachine],
                            artboard: icon.artboard,
                            onInit: (artboard) {
                              _onRiveIconInit(artboard, index);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  onPressed: () {
                    onTabPress(index);
                  },
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
