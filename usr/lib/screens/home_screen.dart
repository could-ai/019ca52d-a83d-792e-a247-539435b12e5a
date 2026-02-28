import 'package:flutter/material.dart';
import '../models/habit.dart';
import '../widgets/habit_card.dart';
import '../widgets/progress_summary.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Mock Data
  final List<Habit> _habits = [
    Habit(
      id: '1',
      title: 'Morning Meditation',
      subtitle: '15 minutes • Mindfulness',
      icon: Icons.self_improvement_rounded,
      color: const Color(0xFF6C63FF), // Purple
      isCompleted: true,
    ),
    Habit(
      id: '2',
      title: 'Drink Water',
      subtitle: '2000 / 2500 ml',
      icon: Icons.water_drop_rounded,
      color: const Color(0xFF4ECDC4), // Teal
      isCompleted: false,
    ),
    Habit(
      id: '3',
      title: 'Read a Book',
      subtitle: '30 minutes • Self Growth',
      icon: Icons.menu_book_rounded,
      color: const Color(0xFFFF6B6B), // Soft Red
      isCompleted: false,
    ),
    Habit(
      id: '4',
      title: 'Evening Run',
      subtitle: '5 km • Cardio',
      icon: Icons.directions_run_rounded,
      color: const Color(0xFF2ECC71), // Green
      isCompleted: false,
    ),
    Habit(
      id: '5',
      title: 'Journaling',
      subtitle: 'Write about your day',
      icon: Icons.edit_note_rounded,
      color: const Color(0xFFFFA502), // Orange
      isCompleted: false,
    ),
  ];

  void _toggleHabit(String id) {
    setState(() {
      final index = _habits.indexWhere((h) => h.id == id);
      if (index != -1) {
        _habits[index].isCompleted = !_habits[index].isCompleted;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final completedCount = _habits.where((h) => h.isCompleted).length;
    final progress = _habits.isEmpty ? 0.0 : completedCount / _habits.length;

    return Scaffold(
      // We use a Stack to place the gradient background behind the content
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFE0EAFC), // Light Blue/Purple mix
                  Color(0xFFCFDEF3), // Light Blue
                  Color(0xFFF4F6FA), // White/Gray
                ],
                stops: [0.0, 0.3, 1.0],
              ),
            ),
          ),
          
          // Decorative Abstract Shapes (Optional subtle blobs)
          Positioned(
            top: -100,
            right: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF6C63FF).withOpacity(0.05),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF6C63FF).withOpacity(0.1),
                    blurRadius: 100,
                    spreadRadius: 20,
                  ),
                ],
              ),
            ),
          ),

          // Main Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Good Morning,",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF9C9EB9),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Alex Johnson",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2D3142),
                              letterSpacing: -0.5,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                          image: const DecorationImage(
                            image: NetworkImage('https://i.pravatar.cc/150?img=12'), // Placeholder avatar
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Progress Card
                  ProgressSummaryCard(
                    progress: progress,
                    completedCount: completedCount,
                    totalCount: _habits.length,
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Section Title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Today's Habits",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF2D3142),
                          letterSpacing: -0.5,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "See All",
                          style: TextStyle(
                            color: Color(0xFF6C63FF),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Habits List
                  Expanded(
                    child: ListView.builder(
                      clipBehavior: Clip.none, // Allow shadows to paint outside bounds
                      itemCount: _habits.length,
                      itemBuilder: (context, index) {
                        final habit = _habits[index];
                        return HabitCard(
                          habit: habit,
                          onTap: () => _toggleHabit(habit.id),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF2D3142),
        elevation: 10,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_rounded, true),
            _buildNavItem(Icons.calendar_month_rounded, false),
            _buildNavItem(Icons.bar_chart_rounded, false),
            _buildNavItem(Icons.settings_rounded, false),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isSelected) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: isSelected
          ? BoxDecoration(
              color: const Color(0xFF6C63FF).withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            )
          : null,
      child: Icon(
        icon,
        color: isSelected ? const Color(0xFF6C63FF) : const Color(0xFF9C9EB9),
        size: 28,
      ),
    );
  }
}
