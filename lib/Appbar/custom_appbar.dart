import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title; 
  
  const CustomAppBar({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    return ClipRRect(
      borderRadius: isMobile 
          ? BorderRadius.zero 
          : const BorderRadius.only(bottomLeft: Radius.circular(30)), 
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF113C7C), Color(0xFF2C6AB8)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: SafeArea(
          child: isMobile ? _buildMobileContent(context) : _buildDesktopContent(width),
        ),
      ),
    );
  }

  Widget _buildMobileContent(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.menu, color: Colors.white, size: 28),
          onPressed: () => Scaffold.of(context).openDrawer(),
          padding: EdgeInsets.zero,
        ),
        const SizedBox(width: 12),
        _notificationIcon(isWhite: true),
        const Spacer(),
        _logoPill(),
      ],
    );
  }

  Widget _buildDesktopContent(double width) {
    return Row(
      children: [
        _profile(),
        const Spacer(),
        _searchBar(width: width < 1024 ? 280 : 400),
        const SizedBox(width: 20),
        _notificationIcon(),
      ],
    );
  }

  Widget _profile() {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/icons/profile.svg',
                width: 26,
                height: 26,
                placeholderBuilder: (context) => const Icon(
                  Icons.person,
                  color: Color(0xFF1E5BA8),
                  size: 26,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'Welcome Back, ADMIN',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _searchBar({required double width}) {
    return Container(
      width: width,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Trips or Bookings...',
          hintStyle: TextStyle(
            color: Colors.grey[400],
            fontSize: 14,
          ),
          prefixIcon: Icon(Icons.search, color: Colors.grey[400], size: 22),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
      ),
    );
  }

  Widget _notificationIcon({bool isWhite = false}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: isWhite ? Colors.white.withOpacity(0.2) : Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/notifications.svg',
              width: 22,
              height: 22,
              colorFilter: ColorFilter.mode(
                isWhite ? Colors.white : const Color(0xFF1E5BA8),
                BlendMode.srcIn,
              ),
              placeholderBuilder: (context) => Icon(
                Icons.notifications_outlined,
                color: isWhite ? Colors.white : const Color(0xFF1E5BA8),
                size: 22,
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
            child: const Text(
              '3',
              style: TextStyle(
                fontSize: 11,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget _logoPill() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Onta TMS',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            'assets/icons/IMG_3113 1.svg',
            width: 20,
            height: 20,
            placeholderBuilder: (context) => const Icon(
              Icons.business,
              color: Color(0xFF1E5BA8),
              size: 20,
            ),
          ),
        ),
      ],
    );
  }

 
  @override
  Size get preferredSize => const Size.fromHeight(70);
}