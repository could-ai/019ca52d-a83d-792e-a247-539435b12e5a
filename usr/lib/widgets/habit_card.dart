import 'package:flutter/material.dart';
import '../models/habit.dart';

class HabitCard extends StatelessWidget {
  final Habit habit;
  final VoidCallback onTap;

  const HabitCard({super.key, required this.habit, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2D3142).withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon Container
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: habit.color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(
              habit.icon,
              color: habit.color,
              size: 26,
            ),
          ),
          const SizedBox(width: 16),
          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  habit.title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2D3142),
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  habit.subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF9C9EB9),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          // Check Button
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(14),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: habit.isCompleted ? habit.color : const Color(0xFFF4F6FA),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: habit.isCompleted ? habit.color : Colors.transparent,
                  width: 2,
                ),
              ),
              child: Icon(
                Icons.check_rounded,
                color: habit.isCompleted ? Colors.white : const Color(0xFFD1D5DB),
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
